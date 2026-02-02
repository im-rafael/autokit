#!/usr/bin/env bash
# =============================================================================
# Researchkit - Verificação de Pré-requisitos
# =============================================================================
# Uso: ./check-prerequisites.sh [--json] [--require-scope] [--require-plan] 
#                                [--require-tasks] [--require-findings]
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# -----------------------------------------------------------------------------
# Argumentos
# -----------------------------------------------------------------------------
JSON_OUTPUT=false
REQUIRE_SCOPE=false
REQUIRE_PLAN=false
REQUIRE_TASKS=false
REQUIRE_FINDINGS=false
PATHS_ONLY=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --json|-j)
            JSON_OUTPUT=true
            shift
            ;;
        --require-scope)
            REQUIRE_SCOPE=true
            shift
            ;;
        --require-plan)
            REQUIRE_PLAN=true
            shift
            ;;
        --require-tasks)
            REQUIRE_TASKS=true
            shift
            ;;
        --require-findings)
            REQUIRE_FINDINGS=true
            shift
            ;;
        --paths-only)
            PATHS_ONLY=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

# -----------------------------------------------------------------------------
# Detectar pesquisa ativa
# -----------------------------------------------------------------------------
detect_active_research() {
    local kb_root
    kb_root=$(get_knowledgebase_root)
    
    # Tentar detectar pelo branch atual
    if check_git; then
        local branch
        branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "")
        
        # Verificar se o branch corresponde a uma pesquisa
        if [[ "$branch" =~ ^research-([0-9]+)-(.+)$ ]]; then
            local research_id="${BASH_REMATCH[1]}"
            local research_name="${BASH_REMATCH[2]}"
            local research_dir="$kb_root/${research_id}-${research_name}"
            
            if [[ -d "$research_dir" ]]; then
                echo "$research_dir"
                return 0
            fi
        fi
    fi
    
    # Fallback: pesquisa mais recente com scope.md
    local latest=""
    for dir in "$kb_root"/[0-9][0-9][0-9]-*/; do
        if [[ -d "$dir" && -f "$dir/scope.md" ]]; then
            latest="$dir"
        fi
    done
    
    if [[ -n "$latest" ]]; then
        echo "${latest%/}"
        return 0
    fi
    
    return 1
}

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------
main() {
    ensure_research_structure
    
    local research_dir=""
    local research_id=""
    local status="OK"
    local available_docs=()
    local missing_docs=()
    
    if research_dir=$(detect_active_research); then
        research_id=$(basename "$research_dir" | grep -oE '^[0-9]+' || echo "000")
        
        # Verificar documentos disponíveis
        [[ -f "$research_dir/scope.md" ]] && available_docs+=("scope.md")
        [[ -f "$research_dir/plan.md" ]] && available_docs+=("plan.md")
        [[ -f "$research_dir/tasks.md" ]] && available_docs+=("tasks.md")
        [[ -f "$research_dir/findings.md" ]] && available_docs+=("findings.md")
        [[ -f "$research_dir/summary.md" ]] && available_docs+=("summary.md")
        
        # Verificar requisitos
        if $REQUIRE_SCOPE && [[ ! -f "$research_dir/scope.md" ]]; then
            missing_docs+=("scope.md")
            status="MISSING_SCOPE"
        fi
        if $REQUIRE_PLAN && [[ ! -f "$research_dir/plan.md" ]]; then
            missing_docs+=("plan.md")
            status="MISSING_PLAN"
        fi
        if $REQUIRE_TASKS && [[ ! -f "$research_dir/tasks.md" ]]; then
            missing_docs+=("tasks.md")
            status="MISSING_TASKS"
        fi
        if $REQUIRE_FINDINGS && [[ ! -f "$research_dir/findings.md" ]]; then
            missing_docs+=("findings.md")
            status="MISSING_FINDINGS"
        fi
    else
        status="NO_ACTIVE_RESEARCH"
        research_dir="$(get_knowledgebase_root)/000-none"
        research_id="000"
    fi
    
    if $JSON_OUTPUT; then
        local available_json
        available_json=$(printf '%s\n' "${available_docs[@]:-}" | jq -R . | jq -s .)
        
        local missing_json
        missing_json=$(printf '%s\n' "${missing_docs[@]:-}" | jq -R . | jq -s . 2>/dev/null || echo "[]")
        
        cat << EOF
{
  "RESEARCH_DIR": "$research_dir",
  "RESEARCH_ID": "$research_id",
  "SCOPE_FILE": "$research_dir/scope.md",
  "PLAN_FILE": "$research_dir/plan.md",
  "TASKS_FILE": "$research_dir/tasks.md",
  "FINDINGS_FILE": "$research_dir/findings.md",
  "SUMMARY_FILE": "$research_dir/summary.md",
  "AVAILABLE_DOCS": $available_json,
  "MISSING_DOCS": $missing_json,
  "STATUS": "$status",
  "KNOWLEDGEBASE_ROOT": "$(get_knowledgebase_root)",
  "HAS_GIT": "$(check_git && echo 'true' || echo 'false')"
}
EOF
    else
        log_info "Research Dir: $research_dir"
        log_info "Research ID: $research_id"
        log_info "Status: $status"
        log_info "Available: ${available_docs[*]:-none}"
        [[ ${#missing_docs[@]} -gt 0 ]] && log_warn "Missing: ${missing_docs[*]}"
    fi
}

main "$@"
