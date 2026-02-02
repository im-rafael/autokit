# Tarefas de Pesquisa: [RESEARCH_TITLE]

**ID**: [RESEARCH_ID]  
**Data**: [DATE]  
**Baseado em**: plan.md

---

## Legenda

- `[P]` = Paralelizável (pode executar junto com outras [P] da mesma fase)
- `R###` = ID da tarefa de pesquisa
- Fontes: `[DOC]` Documentação, `[CODE]` Código, `[ART]` Artigo, `[WEB]` Web geral

---

## Fase 1: Fundamentos

**Objetivo**: Estabelecer base conceitual e terminologia  
**Critério de Conclusão**: [Critério específico]

- [ ] R001 [DOC] Ler documentação oficial de [tema] em [URL/caminho]
- [ ] R002 [DOC] Identificar terminologia-chave e criar glossário local
- [ ] R003 [P] [CODE] Analisar estrutura de [módulo/arquivo] para entender [aspecto]
- [ ] R004 [P] [CODE] Buscar por padrões de [X] no código-fonte

**Checkpoint**: Glossário definido, conceitos base mapeados

---

## Fase 2: Aprofundamento

**Objetivo**: Investigar aspectos específicos das perguntas-guia  
**Pré-requisito**: Fase 1 completa  
**Critério de Conclusão**: [Critério específico]

### Pergunta-Guia 1: [Texto da pergunta]

- [ ] R005 [DOC] Pesquisar [aspecto específico] em [fonte]
- [ ] R006 [P] [ART] Buscar artigos sobre [tema] com filtro [critério]
- [ ] R007 [P] [WEB] Consultar issues/PRs relacionados a [termo]

### Pergunta-Guia 2: [Texto da pergunta]

- [ ] R008 [CODE] Analisar implementação de [funcionalidade]
- [ ] R009 [P] [DOC] Verificar changelog/release notes de [versão]

### Pergunta-Guia 3: [Texto da pergunta]

- [ ] R010 [ART] Pesquisar best practices para [contexto]
- [ ] R011 [P] [WEB] Buscar discussões técnicas sobre [tema]

**Checkpoint**: Respostas preliminares para todas as perguntas-guia

---

## Fase 3: Validação

**Objetivo**: Confirmar achados e identificar contradições  
**Pré-requisito**: Fase 2 completa (pelo menos 80%)  
**Critério de Conclusão**: Confiança >= Médio em todos os achados críticos

- [ ] R012 [P] Cruzar achado F001 com fonte alternativa
- [ ] R013 [P] Cruzar achado F002 com fonte alternativa
- [ ] R014 Verificar datas e versões de todos os achados
- [ ] R015 Documentar contradições encontradas
- [ ] R016 Atribuir grau de confiança final a cada achado

**Checkpoint**: Todos os achados validados e classificados

---

## Fase 4: Consolidação

**Objetivo**: Preparar achados para relatório  
**Pré-requisito**: Fase 3 completa

- [ ] R017 Organizar achados por pergunta-guia
- [ ] R018 Identificar gaps não resolvidos
- [ ] R019 Preparar citações e referências
- [ ] R020 Redigir findings.md

**Checkpoint**: findings.md completo e revisado

---

## Dependências

```
R001 ──► R002 (glossário depende da leitura inicial)
R002 ──► R005-R011 (aprofundamento usa terminologia)
R005-R011 ──► R012-R016 (validação cruza achados)
R012-R016 ──► R017-R020 (consolidação após validação)
```

## Execução Paralela

### Batch 1 (Fase 1)

- R003, R004 podem executar em paralelo após R001

### Batch 2 (Fase 2)

- R006, R007 em paralelo
- R009, R011 em paralelo

### Batch 3 (Fase 3)

- R012, R013 em paralelo

---

## Progresso

| Fase           | Total  | Concluídas | %      |
| -------------- | ------ | ---------- | ------ |
| Fundamentos    | 4      | 0          | 0%     |
| Aprofundamento | 7      | 0          | 0%     |
| Validação      | 5      | 0          | 0%     |
| Consolidação   | 4      | 0          | 0%     |
| **Total**      | **20** | **0**      | **0%** |

---

_Template: researchkit/tasks-template.md_
