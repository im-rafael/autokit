#!/usr/bin/env bash
# =============================================================================
# Researchkit - Criar Nova Pesquisa
# =============================================================================
# Uso: ./create-new-research.sh [--json] --short-name "tema" [--number N] "Descrição"
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# -----------------------------------------------------------------------------
# Argumentos
# -----------------------------------------------------------------------------
JSON_OUTPUT=false
SHORT_NAME=""
NUMBER=""
DESCRIPTION=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --json|-j)
            JSON_OUTPUT=true
            shift
            ;;
        --short-name)
            SHORT_NAME="$2"
            shift 2
            ;;
        --number)
            NUMBER="$2"
            shift 2
            ;;
        *)
            if [[ -z "$DESCRIPTION" ]]; then
                DESCRIPTION="$1"
            fi
            shift
            ;;
    esac
done

# -----------------------------------------------------------------------------
# Validação
# -----------------------------------------------------------------------------
if [[ -z "$SHORT_NAME" ]]; then
    log_error "Short name é obrigatório. Use --short-name \"tema\""
    exit 1
fi

if [[ -z "$DESCRIPTION" ]]; then
    DESCRIPTION="$SHORT_NAME"
fi

# Sanitizar short-name
SHORT_NAME=$(echo "$SHORT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

# -----------------------------------------------------------------------------
# Determinar número
# -----------------------------------------------------------------------------
if [[ -z "$NUMBER" ]]; then
    NUMBER=$(get_next_research_number)
else
    NUMBER=$(printf "%03d" "$NUMBER")
fi

# -----------------------------------------------------------------------------
# Criar estrutura
# -----------------------------------------------------------------------------
ensure_research_structure

KB_ROOT=$(get_knowledgebase_root)
RESEARCH_ID="${NUMBER}-${SHORT_NAME}"
RESEARCH_DIR="$KB_ROOT/$RESEARCH_ID"

if [[ -d "$RESEARCH_DIR" ]]; then
    log_error "Pesquisa já existe: $RESEARCH_DIR"
    exit 1
fi

mkdir -p "$RESEARCH_DIR"
mkdir -p "$RESEARCH_DIR/sources"

# Criar scope.md inicial
TEMPLATE_DIR="$(get_research_root)/templates"
if [[ -f "$TEMPLATE_DIR/scope-template.md" ]]; then
    cp "$TEMPLATE_DIR/scope-template.md" "$RESEARCH_DIR/scope.md"
    # Substituir placeholders
    sed -i "s/\[RESEARCH_ID\]/$RESEARCH_ID/g" "$RESEARCH_DIR/scope.md"
    sed -i "s/\[RESEARCH_TITLE\]/$DESCRIPTION/g" "$RESEARCH_DIR/scope.md"
    sed -i "s/\[DATE\]/$(date +%Y-%m-%d)/g" "$RESEARCH_DIR/scope.md"
else
    cat > "$RESEARCH_DIR/scope.md" << EOF
# Escopo de Pesquisa: $DESCRIPTION

**ID**: $RESEARCH_ID  
**Data**: $(date +%Y-%m-%d)  
**Status**: Em definição

---

## Objetivo

[Descreva o objetivo principal da pesquisa]

## Perguntas-Guia

1. [Pergunta principal que a pesquisa deve responder]
2. [Pergunta secundária]
3. [Pergunta secundária]

## Critérios de Inclusão

- [O que deve ser considerado na pesquisa]

## Critérios de Exclusão

- [O que NÃO deve ser considerado]

## Fontes Candidatas

- [ ] Documentação oficial
- [ ] Código-fonte do projeto
- [ ] Artigos técnicos
- [ ] Discussões em fóruns/issues
- [ ] Outros: [especificar]

## Critérios de Qualidade

- **Confiabilidade mínima**: Médio
- **Requer múltiplas fontes**: Sim/Não
- **Prazo estimado**: [X dias/horas]

## Contexto

$DESCRIPTION

---

*Gerado por researchkit.scope*
EOF
fi

# -----------------------------------------------------------------------------
# Output
# -----------------------------------------------------------------------------
if $JSON_OUTPUT; then
    cat << EOF
{
  "RESEARCH_DIR": "$RESEARCH_DIR",
  "RESEARCH_ID": "$RESEARCH_ID",
  "SCOPE_FILE": "$RESEARCH_DIR/scope.md",
  "PLAN_FILE": "$RESEARCH_DIR/plan.md",
  "TASKS_FILE": "$RESEARCH_DIR/tasks.md",
  "FINDINGS_FILE": "$RESEARCH_DIR/findings.md",
  "SUMMARY_FILE": "$RESEARCH_DIR/summary.md",
  "SHORT_NAME": "$SHORT_NAME",
  "NUMBER": "$NUMBER",
  "DESCRIPTION": "$DESCRIPTION",
  "STATUS": "CREATED"
}
EOF
else
    log_success "Pesquisa criada: $RESEARCH_DIR"
    log_info "Próximo passo: Execute /researchkit.scope para definir o escopo"
fi
