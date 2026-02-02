# iAutokit

**iAutokit** é uma ferramenta CLI para inicialização rápida de projetos com frameworks de agentes pré-configurados para pesquisa rigorosa e especificação técnica.

## Visão Geral

O iAutokit copia estruturas de diretórios, agentes do GitHub Copilot, prompts e scripts para o diretório de trabalho atual, automatizando a configuração inicial de dois frameworks poderosos:

- **ResearchKit**: Framework de agentes para construção rigorosa e incremental de bases de conhecimento
- **SpecKit**: Framework de agentes para especificação e implementação técnica de features

## Frameworks Incluídos

### ResearchKit 🔍

Framework para pesquisa estruturada e rigorosa que opera em etapas bem definidas:

**Agentes Disponíveis:**

- `researchkit.scope`: Define escopo, perguntas-guia, critérios de qualidade e fontes candidatas
- `researchkit.scout`: Executa consulta norteadora rápida para validar viabilidade
- `researchkit.plan`: Gera estratégia detalhada de busca com fases, fontes e filtros
- `researchkit.tasks`: Quebra o plano em tarefas atômicas de pesquisa
- `researchkit.report`: Gera relatório final consolidado dos achados
- `researchkit.summary`: Cria resumos executivos da pesquisa
- `researchkit.integrate`: Integra achados na base de conhecimento permanente

**Princípios Fundamentais:**

- **Rigor Metodológico**: Escopo claro, citação de fontes, conclusões rastreáveis
- **Progressão em Etapas**: Cada fase completa antes de avançar
- **Rastreabilidade**: Identificadores únicos e referências documentadas
- **Qualidade sobre Quantidade**: Critérios de saturação definidos
- **Integração Incremental**: Preservação de conhecimento existente

**Estrutura de Artefatos:**

```
.research/
├── memory/constitution.md
├── scripts/bash/
└── templates/
```

### SpecKit ⚙️

Framework para especificação técnica e planejamento de implementação:

**Agentes Disponíveis:**

- `speckit.specify`: Cria especificação da feature a partir de linguagem natural
- `speckit.clarify`: Esclarece requisitos e resolve ambiguidades
- `speckit.analyze`: Analisa impacto técnico e dependências
- `speckit.constitution`: Define e valida princípios arquiteturais
- `speckit.plan`: Executa fluxo de planejamento de implementação
- `speckit.tasks`: Quebra o plano em tarefas executáveis
- `speckit.checklist`: Gera checklists de verificação
- `speckit.implement`: Guia a implementação técnica
- `speckit.taskstoissues`: Converte tarefas em issues do GitHub

**Fluxo de Trabalho:**

1. **Especificação**: Descrição natural → spec detalhada
2. **Análise**: Contexto técnico, dependências, constraints
3. **Planejamento**: Design, contratos, data models
4. **Implementação**: TDD, library-first, observabilidade

**Estrutura de Artefatos:**

```
.specify/
├── memory/constitution.md
├── scripts/bash/
└── templates/
```

## Instalação

```bash
npm install -g iautokit
```

Ou execute diretamente com `npx`:

```bash
npx iautokit
```

## Uso

No diretório raiz do seu projeto:

```bash
iautokit
```

Isso irá:

1. Copiar toda a estrutura de `base/` para o diretório atual
2. Adicionar regras de exclusão ao `.git/info/exclude` (se for um repositório Git)
3. Configurar agentes do GitHub Copilot
4. Instalar scripts e templates de automação

## O que é Instalado

### Agentes do GitHub Copilot

- 17 agentes especializados (8 ResearchKit + 9 SpecKit)
- Cada agente com descrição, handoffs e fluxo de trabalho
- Prompts customizados em português do Brasil

### Configurações VS Code

- `.vscode/settings.json`: Recomendações de prompts, auto-aprovação de scripts
- `.vscode/mcp.json`: Servidores MCP (Serena, Playwright, DBHub, Context7)

### Scripts de Automação

- Bash scripts para verificação de pré-requisitos
- Scripts de criação de nova pesquisa/feature
- Scripts de setup e atualização de contexto

### Templates

- Templates de findings, plans, scopes, tasks
- Templates de especificação, checklist, data model
- Estrutura pronta para documentação técnica

### Constituições (Design Principles)

- Documento de princípios fundamentais para cada framework
- Gates de qualidade e critérios de validação
- Governança e processo de emendas

## Regras de Exclusão

O arquivo `base/exclude` contém padrões que serão automaticamente adicionados ao `.git/info/exclude`:

```
.serena/
.github/
.research/
.specify/
.vscode/
specs/
```

Isso mantém artefatos de trabalho fora do controle de versão sem modificar o `.gitignore` do projeto.

## Estrutura do Projeto Base

```
base/
├── exclude                           # Regras de exclusão Git
├── .github/
│   ├── copilot-instructions.md       # Instruções gerais do Copilot
│   ├── agents/                       # 17 agentes especializados
│   └── prompts/                      # Prompts customizados
├── .research/
│   ├── memory/constitution.md        # Princípios do ResearchKit
│   ├── scripts/bash/                 # Scripts de automação
│   └── templates/                    # Templates de documentos
├── .specify/
│   ├── memory/constitution.md        # Princípios do SpecKit
│   ├── scripts/bash/                 # Scripts de automação
│   └── templates/                    # Templates de especificação
└── .vscode/
    ├── settings.json                 # Configurações do editor
    └── mcp.json                      # Configuração de servidores MCP
```

## Casos de Uso

### Iniciar uma Nova Pesquisa

```bash
# Após instalar o autokit
/researchkit.scope "arquitetura de microservices com event sourcing"
```

O agente irá:

1. Criar estrutura de diretórios em `.research/`
2. Definir escopo e perguntas-guia
3. Propor handoff para consulta norteadora

### Especificar uma Nova Feature

```bash
/speckit.specify "adicionar autenticação OAuth2 com Google"
```

O agente irá:

1. Criar branch e estrutura em `.specify/`
2. Gerar especificação detalhada
3. Validar contra a constituição do projeto
4. Propor handoff para planejamento técnico

## Requisitos

- Node.js 14+
- Git (opcional, para regras de exclusão)
- VS Code (recomendado, para aproveitar agentes do Copilot)

## Contribuindo

Contribuições são bem-vindas! O projeto segue princípios de:

- Simplicidade (YAGNI)
- Library-first approach
- Text I/O protocol (stdin/stdout)
- Documentação inline

## Licença

MIT License - veja [LICENSE](LICENSE) para detalhes.

## Suporte

Para issues e dúvidas, abra uma issue no [repositório GitHub](https://github.com/im-rafael/iautokit/issues).
