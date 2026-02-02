#!/usr/bin/env bash

# Script consolidado de verificação de pré-requisitos
#
# Este script fornece verificação unificada de pré-requisitos para o fluxo de trabalho de Desenvolvimento Orientado por Especificação.
# Substitui a funcionalidade previamente espalhada por múltiplos scripts.
#
# Uso: ./check-prerequisites.sh [OPÇÕES]
#
# OPÇÕES:
#   --json              Saída em formato JSON
#   --require-tasks     Requer que tasks.md exista (para fase de implementação)
#   --include-tasks     Inclui tasks.md na lista AVAILABLE_DOCS
#   --paths-only        Apenas saída de variáveis de caminho (sem validação)
#   --help, -h          Mostra mensagem de ajuda
#
# SAÍDAS:
#   Modo JSON: {"FEATURE_DIR":"...", "AVAILABLE_DOCS":["..."]}
#   Modo Texto: FEATURE_DIR:... \n AVAILABLE_DOCS: \n ✓/✗ file.md
#   Apenas Caminhos: REPO_ROOT: ... \n BRANCH: ... \n FEATURE_DIR: ... etc.

set -e

# Parse command line arguments
JSON_MODE=false
REQUIRE_TASKS=false
INCLUDE_TASKS=false
PATHS_ONLY=false

for arg in "$@"; do
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --require-tasks)
            REQUIRE_TASKS=true
            ;;
        --include-tasks)
            INCLUDE_TASKS=true
            ;;
        --paths-only)
            PATHS_ONLY=true
            ;;
        --help|-h)
            cat << 'EOF'
Uso: check-prerequisites.sh [OPÇÕES]

Verificação consolidada de pré-requisitos para fluxo de trabalho de Desenvolvimento Orientado por Especificação.

OPÇÕES:
  --json              Saída em formato JSON
  --require-tasks     Requer que tasks.md exista (para fase de implementação)
  --include-tasks     Inclui tasks.md na lista AVAILABLE_DOCS
  --paths-only        Apenas saída de variáveis de caminho (sem validação de pré-requisitos)
  --help, -h          Mostra esta mensagem de ajuda

EXEMPLOS:
  # Verificar pré-requisitos de tarefa (plan.md obrigatório)
  ./check-prerequisites.sh --json
  
  # Verificar pré-requisitos de implementação (plan.md + tasks.md obrigatório)
  ./check-prerequisites.sh --json --require-tasks --include-tasks
  
  # Obter apenas caminhos de funcionalidade (sem validação)
  ./check-prerequisites.sh --paths-only
  
EOF
            exit 0
            ;;
        *)
            echo "ERRO: Opção desconhecida '$arg'. Use --help para informações de uso." >&2
            exit 1
            ;;
    esac
done

# Source common functions
SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Get feature paths and validate branch
eval $(get_feature_paths)
check_feature_branch "$CURRENT_BRANCH" "$HAS_GIT" || exit 1

# If paths-only mode, output paths and exit (support JSON + paths-only combined)
if $PATHS_ONLY; then
    if $JSON_MODE; then
        # Minimal JSON paths payload (no validation performed)
        printf '{"REPO_ROOT":"%s","BRANCH":"%s","FEATURE_DIR":"%s","FEATURE_SPEC":"%s","IMPL_PLAN":"%s","TASKS":"%s"}\n' \
            "$REPO_ROOT" "$CURRENT_BRANCH" "$FEATURE_DIR" "$FEATURE_SPEC" "$IMPL_PLAN" "$TASKS"
    else
        echo "REPO_ROOT: $REPO_ROOT"
        echo "BRANCH: $CURRENT_BRANCH"
        echo "FEATURE_DIR: $FEATURE_DIR"
        echo "FEATURE_SPEC: $FEATURE_SPEC"
        echo "IMPL_PLAN: $IMPL_PLAN"
        echo "TASKS: $TASKS"
    fi
    exit 0
fi

# Validar diretórios e arquivos obrigatórios
if [[ ! -d "$FEATURE_DIR" ]]; then
    echo "ERRO: Diretório de funcionalidade não encontrado: $FEATURE_DIR" >&2
    echo "Execute /speckit.specify primeiro para criar a estrutura de funcionalidade." >&2
    exit 1
fi

if [[ ! -f "$IMPL_PLAN" ]]; then
    echo "ERRO: plan.md não encontrado em $FEATURE_DIR" >&2
    echo "Execute /speckit.plan primeiro para criar o plano de implementação." >&2
    exit 1
fi

# Verificar tasks.md se obrigatório
if $REQUIRE_TASKS && [[ ! -f "$TASKS" ]]; then
    echo "ERRO: tasks.md não encontrado em $FEATURE_DIR" >&2
    echo "Execute /speckit.tasks primeiro para criar a lista de tarefas." >&2
    exit 1
fi

# Construir lista de documentos disponíveis
docs=()

# Sempre verificar estes documentos opcionais
[[ -f "$RESEARCH" ]] && docs+=("research.md")
[[ -f "$DATA_MODEL" ]] && docs+=("data-model.md")

# Verificar diretório de contracts (apenas se existe e tem arquivos)
if [[ -d "$CONTRACTS_DIR" ]] && [[ -n "$(ls -A "$CONTRACTS_DIR" 2>/dev/null)" ]]; then
    docs+=("contracts/")
fi

[[ -f "$QUICKSTART" ]] && docs+=("quickstart.md")

# Incluir tasks.md se solicitado e existe
if $INCLUDE_TASKS && [[ -f "$TASKS" ]]; then
    docs+=("tasks.md")
fi

# Saída de resultados
if $JSON_MODE; then
    # Construir array JSON de documentos
    if [[ ${#docs[@]} -eq 0 ]]; then
        json_docs="[]"
    else
        json_docs=$(printf '"%s",' "${docs[@]}")
        json_docs="[${json_docs%,}]"
    fi
    
    printf '{"FEATURE_DIR":"%s","AVAILABLE_DOCS":%s}\n' "$FEATURE_DIR" "$json_docs"
else
    # Saída em texto
    echo "FEATURE_DIR:$FEATURE_DIR"
    echo "AVAILABLE_DOCS:"
    
    # Mostrar status de cada documento potencial
    check_file "$RESEARCH" "research.md"
    check_file "$DATA_MODEL" "data-model.md"
    check_dir "$CONTRACTS_DIR" "contracts/"
    check_file "$QUICKSTART" "quickstart.md"
    
    if $INCLUDE_TASKS; then
        check_file "$TASKS" "tasks.md"
    fi
fi
