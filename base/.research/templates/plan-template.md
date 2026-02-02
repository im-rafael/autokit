# Plano de Pesquisa: [RESEARCH_TITLE]

**ID**: [RESEARCH_ID]  
**Data**: [DATE]  
**Baseado em**: scope.md

---

## Resumo da Consulta Norteadora

[Síntese dos achados da consulta rápida inicial realizada pelo researchkit.scout]

### Viabilidade

- **Status**: Viável / Parcialmente Viável / Requer Ajuste
- **Justificativa**: [Por que a pesquisa é viável ou não]

### Lacunas Identificadas

1. [Lacuna 1 identificada na consulta norteadora]
2. [Lacuna 2]

### Ajustes no Escopo

- [Ajuste recomendado, se houver]

---

## Estratégia de Busca

### Fase 1: Fundamentos

**Objetivo**: Estabelecer base conceitual e terminologia

| Fonte     | Tipo     | Prioridade | Tempo Est. |
| --------- | -------- | ---------- | ---------- |
| [Fonte 1] | Primária | Alta       | [X min]    |
| [Fonte 2] | Primária | Alta       | [X min]    |

**Queries/Termos de Busca**:

- `[termo 1]`
- `[termo 2]`

**Critério de Conclusão**: [O que marca o fim desta fase]

### Fase 2: Aprofundamento

**Objetivo**: Investigar aspectos específicos das perguntas-guia

| Fonte     | Tipo       | Prioridade | Tempo Est. |
| --------- | ---------- | ---------- | ---------- |
| [Fonte 3] | Secundária | Média      | [X min]    |
| [Fonte 4] | Secundária | Média      | [X min]    |

**Queries/Termos de Busca**:

- `[termo específico 1]`
- `[termo específico 2]`

**Critério de Conclusão**: [O que marca o fim desta fase]

### Fase 3: Validação

**Objetivo**: Confirmar achados com fontes adicionais e identificar contradições

| Fonte     | Tipo      | Prioridade | Tempo Est. |
| --------- | --------- | ---------- | ---------- |
| [Fonte 5] | Terciária | Baixa      | [X min]    |

**Estratégia de Validação**:

- [ ] Cruzar achados entre fontes independentes
- [ ] Verificar datas e versões
- [ ] Identificar vieses de fonte

**Critério de Conclusão**: [O que marca o fim desta fase]

---

## Heurísticas de Busca

### Filtros Obrigatórios

- Data: [>= YYYY-MM-DD]
- Idioma: [pt, en]
- Tipo: [docs, code, article]

### Sinais de Qualidade

- ✅ Fonte oficial ou reconhecida
- ✅ Data de publicação clara
- ✅ Autor identificável
- ⚠️ Fonte não verificada
- ❌ Informação desatualizada

### Critérios de Parada

- **Por saturação**: N fontes consecutivas sem nova informação
- **Por tempo**: Máximo de [X horas] por fase
- **Por qualidade**: Confiança >= [Médio/Alto] em todas as perguntas

---

## Dependências entre Fases

```
Fase 1 (Fundamentos)
    │
    ├──► Fase 2 (Aprofundamento) [depende de terminologia da Fase 1]
    │
    └──► Fase 3 (Validação) [pode iniciar em paralelo após Fase 1]
```

## Riscos e Mitigações

| Risco                      | Probabilidade | Impacto | Mitigação                                        |
| -------------------------- | ------------- | ------- | ------------------------------------------------ |
| Documentação desatualizada | Média         | Alto    | Verificar código-fonte como fonte de verdade     |
| Informação conflitante     | Média         | Médio   | Priorizar fontes primárias, documentar conflitos |
| Escopo muito amplo         | Baixa         | Alto    | Revisar critérios de exclusão                    |

## Estimativa de Esforço

| Fase           | Tarefas Est. | Tempo Est. | Paralelizável |
| -------------- | ------------ | ---------- | ------------- |
| Fundamentos    | [N]          | [X h]      | Não           |
| Aprofundamento | [N]          | [X h]      | Parcial       |
| Validação      | [N]          | [X h]      | Sim           |
| **Total**      | **[N]**      | **[X h]**  | -             |

---

_Template: researchkit/plan-template.md_
