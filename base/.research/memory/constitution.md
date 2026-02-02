# Researchkit — Constituição de Pesquisa

**Versão**: 1.0.0  
**Data de Ratificação**: 2026-01-29  
**Última Emenda**: 2026-01-29

---

## Visão Geral

O researchkit é um framework de agentes para construção rigorosa e incremental de bases de conhecimento. Ele opera em etapas bem definidas, desde a especificação do tema até a integração dos achados na base de conhecimento permanente.

## Princípios Fundamentais (INEGOCIÁVEIS)

### I. Rigor Metodológico

- **MUST**: Toda pesquisa DEVE ter escopo claramente definido antes de iniciar buscas.
- **MUST**: Achados DEVEM incluir citação de fonte e grau de confiança.
- **MUST**: Conclusões DEVEM ser rastreáveis aos achados que as fundamentam.
- **SHOULD**: Fontes primárias devem ser preferidas sobre fontes secundárias.

### II. Progressão em Etapas

- **MUST**: Cada etapa DEVE ser concluída antes de avançar para a próxima.
- **MUST**: Artefatos de cada etapa DEVEM ser persistidos antes do handoff.
- **SHOULD**: Revisão de etapa anterior é permitida, mas DEVE ser documentada.

### III. Rastreabilidade

- **MUST**: Todo achado DEVE ter identificador único (F001, F002...).
- **MUST**: Todo insight DEVE referenciar achados de origem.
- **MUST**: Toda atualização na knowledgebase DEVE ter justificativa documentada.

### IV. Qualidade sobre Quantidade

- **MUST**: Critérios de saturação DEVEM ser definidos antes da busca.
- **SHOULD**: Achados duplicados ou redundantes devem ser consolidados.
- **SHOULD**: Gaps de conhecimento devem ser explicitamente documentados.

### V. Integração Incremental

- **MUST**: A knowledgebase DEVE ser atualizada apenas via `researchkit.integrate`.
- **MUST**: Atualizações DEVEM preservar conhecimento existente válido.
- **SHOULD**: Conflitos com conhecimento anterior devem ser resolvidos explicitamente.

## Estrutura de Artefatos

```
knowledgebase/
├── index.md                    # Índice geral com links e versões
└── [NNN]-[tema]/
    ├── scope.md                # Escopo e perguntas-guia
    ├── plan.md                 # Estratégia de busca
    ├── tasks.md                # Tarefas de busca atômicas
    ├── findings.md             # Achados consolidados
    ├── summary.md              # Insights e recomendações
    └── sources/                # Fontes primárias arquivadas (opcional)
```

## Graus de Confiança

| Grau        | Descrição                                  | Critério                                                          |
| ----------- | ------------------------------------------ | ----------------------------------------------------------------- |
| **Alto**    | Fonte primária, verificável, consenso      | Documentação oficial, código-fonte, múltiplas fontes concordantes |
| **Médio**   | Fonte secundária, parcialmente verificável | Artigos técnicos, tutoriais reconhecidos, uma fonte confiável     |
| **Baixo**   | Inferência, fonte não verificada           | Fóruns, inferência lógica, fonte única não oficial                |
| **Incerto** | Requer validação adicional                 | Informação conflitante, fonte desconhecida                        |

## Governança

- **Versionamento**: Usar SemVer para a knowledgebase (MAJOR.MINOR.PATCH).
- **Revisão**: Conhecimento com mais de 6 meses deve ser marcado para revisão.
- **Emendas**: Alterações nesta constituição requerem incremento de versão MINOR ou MAJOR.
