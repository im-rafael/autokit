---

description: "Lista de tarefas template para implementação de funcionalidade"
---

# Tarefas: [NOME DA FUNCIONALIDADE]

**Entrada**: Documentos de design de `/specs/[###-feature-name]/`
**Pré-requisitos**: plan.md (obrigatório), spec.md (obrigatório para histórias de usuário), research.md, data-model.md, contracts/

**Testes**: Os exemplos abaixo incluem tarefas de teste. Testes são OPCIONAIS - inclua apenas se explicitamente solicitado na especificação da funcionalidade.

**Organização**: Tarefas são agrupadas por história de usuário para permitir implementação e teste independentes de cada história.

## Formato: `[ID] [P?] [História] Descrição`

- **[P]**: Pode executar em paralelo (arquivos diferentes, sem dependências)
- **[História]**: Qual história de usuário esta tarefa pertence (ex: US1, US2, US3)
- Inclua caminhos de arquivo exatos em descrições

## Convenções de Caminho

- **Projeto único**: `src/`, `tests/` na raiz do repositório
- **Aplicação web**: `backend/src/`, `frontend/src/`
- **Mobile**: `api/src/`, `ios/src/` ou `android/src/`
- Caminhos abaixo assumem projeto único - ajuste baseado em estrutura de plan.md

<!-- 
  ============================================================================
  IMPORTANTE: As tarefas abaixo são TAREFAS DE EXEMPLO apenas para fins de ilustração.
  
  O comando /speckit.tasks DEVE substituir essas tarefas com tarefas reais baseado em:
  - Histórias de usuário em spec.md (com suas prioridades P1, P2, P3...)
  - Requisitos de funcionalidade em plan.md
  - Entidades de data-model.md
  - Endpoints de contracts/
  
  Tarefas DEVEM ser organizadas por história de usuário para que cada história possa ser:
  - Implementada independentemente
  - Testada independentemente
  - Entregue como incremento MVP
  
  NÃO mantenha essas tarefas de exemplo no arquivo tasks.md gerado.
  ============================================================================
-->

## Fase 1: Configuração (Infraestrutura Compartilhada)

**Objetivo**: Inicialização do projeto e estrutura básica

- [ ] T001 Criar estrutura do projeto conforme plano de implementação
- [ ] T002 Inicializar projeto [linguagem] com dependências [framework]
- [ ] T003 [P] Configurar ferramentas de linting e formatação

---

## Fase 2: Fundacional (Pré-requisitos de Bloqueio)

**Objetivo**: Infraestrutura principal que DEVE estar concluída antes de QUALQUER trabalho de história de usuário

**⚠️ CRÍTICO**: Nenhum trabalho de história de usuário pode começar até que esta fase esteja completa

Exemplos de tarefas fundacionais (ajuste baseado em seu projeto):

- [ ] T004 Configurar esquema de banco de dados e framework de migrações
- [ ] T005 [P] Implementar framework de autenticação/autorização
- [ ] T006 [P] Configurar estrutura de roteamento de API e middleware
- [ ] T007 Criar modelos/entidades base que todas as histórias dependem
- [ ] T008 Configurar infraestrutura de tratamento de erros e logging
- [ ] T009 Configurar gerenciamento de configuração de ambiente

**Ponto de Verificação**: Fundação pronta - implementação de história de usuário pode agora começar em paralelo

---

## Fase 3: História de Usuário 1 - [Título] (Prioridade: P1) 🎯 MVP

**Objetivo**: [Descrição breve do que esta história entrega]

**Teste Independente**: [Como verificar que esta história funciona por si só]

### Testes para História de Usuário 1 (OPCIONAIS - apenas se testes solicitados) ⚠️

> **NOTA: Escreva estes testes PRIMEIRO, garanta que FALHEM antes de implementação**

- [ ] T010 [P] [US1] Teste de contrato para [endpoint] em tests/contract/test_[name].py
- [ ] T011 [P] [US1] Teste de integração para [jornada do usuário] em tests/integration/test_[name].py

### Implementação para História de Usuário 1

- [ ] T012 [P] [US1] Criar modelo [Entidade1] em src/models/[entity1].py
- [ ] T013 [P] [US1] Criar modelo [Entidade2] em src/models/[entity2].py
- [ ] T014 [US1] Implementar [Serviço] em src/services/[service].py (depende de T012, T013)
- [ ] T015 [US1] Implementar [endpoint/funcionalidade] em src/[location]/[file].py
- [ ] T016 [US1] Adicionar validação e tratamento de erros
- [ ] T017 [US1] Adicionar logging para operações da história de usuário 1

**Ponto de Verificação**: Neste ponto, História de Usuário 1 deve estar totalmente funcional e testável independentemente

---

## Fase 4: História de Usuário 2 - [Título] (Prioridade: P2)

**Objetivo**: [Descrição breve do que esta história entrega]

**Teste Independente**: [Como verificar que esta história funciona por si só]

### Testes para História de Usuário 2 (OPCIONAIS - apenas se testes solicitados) ⚠️

- [ ] T018 [P] [US2] Teste de contrato para [endpoint] em tests/contract/test_[name].py
- [ ] T019 [P] [US2] Teste de integração para [jornada do usuário] em tests/integration/test_[name].py

### Implementação para História de Usuário 2

- [ ] T020 [P] [US2] Criar modelo [Entidade] em src/models/[entity].py
- [ ] T021 [US2] Implementar [Serviço] em src/services/[service].py
- [ ] T022 [US2] Implementar [endpoint/funcionalidade] em src/[location]/[file].py
- [ ] T023 [US2] Integrar com componentes da História de Usuário 1 (se necessário)

**Ponto de Verificação**: Neste ponto, Histórias de Usuário 1 E 2 devem ambas funcionar independentemente

---

## Fase 5: História de Usuário 3 - [Título] (Prioridade: P3)

**Objetivo**: [Descrição breve do que esta história entrega]

**Teste Independente**: [Como verificar que esta história funciona por si só]

### Testes para História de Usuário 3 (OPCIONAIS - apenas se testes solicitados) ⚠️

- [ ] T024 [P] [US3] Teste de contrato para [endpoint] em tests/contract/test_[name].py
- [ ] T025 [P] [US3] Teste de integração para [jornada do usuário] em tests/integration/test_[name].py

### Implementação para História de Usuário 3

- [ ] T026 [P] [US3] Criar modelo [Entidade] em src/models/[entity].py
- [ ] T027 [US3] Implementar [Serviço] em src/services/[service].py
- [ ] T028 [US3] Implementar [endpoint/funcionalidade] em src/[location]/[file].py

**Ponto de Verificação**: Todas as histórias de usuário devem agora estar independentemente funcionais

---

[Adicione mais fases de história de usuário conforme necessário, seguindo o mesmo padrão]

---

## Fase N: Polimento e Preocupações Transversais

**Objetivo**: Melhorias que afetam múltiplas histórias de usuário

- [ ] TXXX [P] Atualizações de documentação em docs/
- [ ] TXXX Limpeza de código e refatoração
- [ ] TXXX Otimização de desempenho em todas as histórias
- [ ] TXXX [P] Testes unitários adicionais (se solicitados) em tests/unit/
- [ ] TXXX Endurecimento de segurança
- [ ] TXXX Executar validação quickstart.md

---

## Dependências e Ordem de Execução

### Dependências de Fase

- **Configuração (Fase 1)**: Sem dependências - pode começar imediatamente
- **Fundacional (Fase 2)**: Depende de conclusão de Configuração - BLOQUEIA todas as histórias
- **Histórias de Usuário (Fase 3+)**: Todas dependem de conclusão da fase Fundacional
  - Histórias de usuário podem então proceder em paralelo (se com equipe)
  - Ou sequencialmente em ordem de prioridade (P1 → P2 → P3)
- **Polimento (Fase Final)**: Depende de todas as histórias desejadas estarem completas

### Dependências de História de Usuário

- **História de Usuário 1 (P1)**: Pode começar após Fundacional (Fase 2) - Sem dependências de outras histórias
- **História de Usuário 2 (P2)**: Pode começar após Fundacional (Fase 2) - Pode integrar com US1 mas deve ser independentemente testável
- **História de Usuário 3 (P3)**: Pode começar após Fundacional (Fase 2) - Pode integrar com US1/US2 mas deve ser independentemente testável

### Dentro de Cada História de Usuário

- Testes (se incluídos) DEVEM ser escritos e FALHAREM antes de implementação
- Modelos antes de serviços
- Serviços antes de endpoints
- Implementação principal antes de integração
- História completa antes de passar para próxima prioridade

### Oportunidades Paralelas

- Todas as tarefas de Configuração marcadas [P] podem executar em paralelo
- Todas as tarefas Fundacionais marcadas [P] podem executar em paralelo (dentro da Fase 2)
- Uma vez que fase Fundacional completa, todas as histórias de usuário podem começar em paralelo (se equipe permite)
- Todos os testes para uma história de usuário marcados [P] podem executar em paralelo
- Modelos dentro de uma história marcados [P] podem executar em paralelo
- Diferentes histórias de usuário podem ser trabalhadas em paralelo por diferentes membros da equipe

---

## Exemplo Paralelo: História de Usuário 1

```bash
# Iniciar todos os testes para História de Usuário 1 juntos (se testes solicitados):
Tarefa: "Teste de contrato para [endpoint] em tests/contract/test_[name].py"
Tarefa: "Teste de integração para [jornada do usuário] em tests/integration/test_[name].py"

# Iniciar todos os modelos para História de Usuário 1 juntos:
Tarefa: "Criar modelo [Entidade1] em src/models/[entity1].py"
Tarefa: "Criar modelo [Entidade2] em src/models/[entity2].py"
```

---

## Estratégia de Implementação

### MVP Primeiro (Apenas História de Usuário 1)

1. Completar Fase 1: Configuração
2. Completar Fase 2: Fundacional (CRÍTICO - bloqueia todas as histórias)
3. Completar Fase 3: História de Usuário 1
4. **PARAR e VALIDAR**: Testar História de Usuário 1 independentemente
5. Deploy/demo se pronto

### Entrega Incremental

1. Completar Configuração + Fundacional → Fundação pronta
2. Adicionar História de Usuário 1 → Testar independentemente → Deploy/Demo (MVP!)
3. Adicionar História de Usuário 2 → Testar independentemente → Deploy/Demo
4. Adicionar História de Usuário 3 → Testar independentemente → Deploy/Demo
5. Cada história adiciona valor sem quebrar histórias anteriores

### Estratégia de Equipe Paralela

Com múltiplos desenvolvedores:

1. Equipe completa Configuração + Fundacional juntos
2. Uma vez Fundacional pronto:
   - Desenvolvedor A: História de Usuário 1
   - Desenvolvedor B: História de Usuário 2
   - Desenvolvedor C: História de Usuário 3
3. Histórias completam e integram independentemente

---

## Notas

- [P] tarefas = arquivos diferentes, sem dependências
- Rótulo [História] mapeia tarefa para história de usuário específica para rastreabilidade
- Cada história de usuário deve ser independentemente completável e testável
- Verifique que testes falhem antes de implementar
- Commit após cada tarefa ou grupo lógico
- Pare em qualquer ponto de verificação para validar história independentemente
- Evite: tarefas vagas, conflitos de arquivo no mesmo, dependências entre histórias que quebram independência
