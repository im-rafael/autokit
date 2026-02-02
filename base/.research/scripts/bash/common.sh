#!/usr/bin/env bash
# =============================================================================
# Researchkit - Funções Compartilhadas
# =============================================================================

set -euo pipefail

# -----------------------------------------------------------------------------
# Cores para output
# -----------------------------------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------
log_info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

log_success() {
    echo -e "${GREEN}[OK]${NC} $*"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# -----------------------------------------------------------------------------
# Utilitários de caminho
# -----------------------------------------------------------------------------
get_repo_root() {
    git rev-parse --show-toplevel 2>/dev/null || pwd
}

get_research_root() {
    echo "$(get_repo_root)/.research"
}

get_knowledgebase_root() {
    echo "$(get_repo_root)/knowledgebase"
}

# -----------------------------------------------------------------------------
# Verificação de pré-requisitos
# -----------------------------------------------------------------------------
check_git() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Geração de IDs
# -----------------------------------------------------------------------------
get_next_research_number() {
    local kb_root
    kb_root=$(get_knowledgebase_root)
    
    if [[ ! -d "$kb_root" ]]; then
        echo "001"
        return
    fi
    
    local max_num=0
    for dir in "$kb_root"/[0-9][0-9][0-9]-*/; do
        if [[ -d "$dir" ]]; then
            local num
            num=$(basename "$dir" | grep -oE '^[0-9]+' || echo "0")
            num=$((10#$num))
            if (( num > max_num )); then
                max_num=$num
            fi
        fi
    done
    
    printf "%03d" $((max_num + 1))
}

# -----------------------------------------------------------------------------
# Validação de estrutura
# -----------------------------------------------------------------------------
ensure_research_structure() {
    local research_root
    research_root=$(get_research_root)
    
    mkdir -p "$research_root/memory"
    mkdir -p "$research_root/scripts/bash"
    mkdir -p "$research_root/templates"
    
    local kb_root
    kb_root=$(get_knowledgebase_root)
    mkdir -p "$kb_root"
    
    # Criar index.md se não existir
    if [[ ! -f "$kb_root/index.md" ]]; then
        cat > "$kb_root/index.md" << 'EOF'
# Knowledge Base Index

**Versão**: 1.0.0  
**Última Atualização**: $(date +%Y-%m-%d)

---

## Pesquisas

| ID | Tema | Status | Data | Links |
|----|------|--------|------|-------|

---

## Temas por Categoria

### [Categoria]
- *Nenhum tema ainda*

---

## Estatísticas

- **Total de Pesquisas**: 0
- **Achados Catalogados**: 0
- **Última Atualização**: N/A
EOF
    fi
}

# -----------------------------------------------------------------------------
# JSON output helper
# -----------------------------------------------------------------------------
json_output() {
    local research_dir="$1"
    local research_id="$2"
    local status="$3"
    
    cat << EOF
{
  "RESEARCH_DIR": "$research_dir",
  "RESEARCH_ID": "$research_id",
  "SCOPE_FILE": "$research_dir/scope.md",
  "PLAN_FILE": "$research_dir/plan.md",
  "TASKS_FILE": "$research_dir/tasks.md",
  "FINDINGS_FILE": "$research_dir/findings.md",
  "SUMMARY_FILE": "$research_dir/summary.md",
  "STATUS": "$status",
  "KNOWLEDGEBASE_ROOT": "$(get_knowledgebase_root)",
  "HAS_GIT": "$(check_git && echo 'true' || echo 'false')"
}
EOF
}
