# Especificação de Funcionalidade: [NOME DA FUNCIONALIDADE]

**Branch da Funcionalidade**: `[###-feature-name]`  
**Criada**: [DATA]  
**Status**: Rascunho  
**Entrada**: Descrição do usuário: "$ARGUMENTS"

## Cenários de Usuário e Testes *(obrigatório)*

<!--
  IMPORTANTE: As histórias de usuário devem ser PRIORIZADAS como jornadas de usuário ordenadas por importância.
  Cada história de usuário/jornada deve ser INDEPENDENTEMENTE TESTÁVEL - significando que se você implementar apenas UMA delas,
  você ainda deve ter um MVP (Produto Mínimo Viável) que entregue valor.
  
  Atribua prioridades (P1, P2, P3, etc.) a cada história, onde P1 é a mais crítica.
  Pense em cada história como um slice independente de funcionalidade que pode ser:
  - Desenvolvido independentemente
  - Testado independentemente
  - Deployado independentemente
  - Demonstrado para usuários independentemente
-->

### História de Usuário 1 - [Título Breve] (Prioridade: P1)

[Descreva esta jornada de usuário em linguagem simples]

**Por que esta prioridade**: [Explique o valor e por que tem esta prioridade]

**Teste Independente**: [Descreva como isso pode ser testado independentemente - ex: "Pode ser totalmente testado por [ação específica] e entrega [valor específico]"]

**Cenários de Aceitação**:

1. **Dado** [estado inicial], **Quando** [ação], **Então** [resultado esperado]
2. **Dado** [estado inicial], **Quando** [ação], **Então** [resultado esperado]

---

### História de Usuário 2 - [Título Breve] (Prioridade: P2)

[Descreva esta jornada de usuário em linguagem simples]

**Por que esta prioridade**: [Explique o valor e por que tem esta prioridade]

**Teste Independente**: [Descreva como isso pode ser testado independentemente]

**Cenários de Aceitação**:

1. **Dado** [estado inicial], **Quando** [ação], **Então** [resultado esperado]

---

### História de Usuário 3 - [Título Breve] (Prioridade: P3)

[Descreva esta jornada de usuário em linguagem simples]

**Por que esta prioridade**: [Explique o valor e por que tem esta prioridade]

**Teste Independente**: [Descreva como isso pode ser testado independentemente]

**Cenários de Aceitação**:

1. **Dado** [estado inicial], **Quando** [ação], **Então** [resultado esperado]

---

[Adicione mais histórias de usuário conforme necessário, cada uma com prioridade atribuída]

### Casos Extremos

<!--
  AÇÃO NECESSÁRIA: O conteúdo nesta seção representa placeholders.
  Preencha-os com os casos extremos corretos.
-->

- O que acontece quando [condição de limite]?
- Como o sistema trata [cenário de erro]?

## Requisitos *(obrigatório)*

<!--
  AÇÃO NECESSÁRIA: O conteúdo nesta seção representa placeholders.
  Preencha-o com os requisitos funcionais corretos.
-->

### Requisitos Funcionais

- **RF-001**: Sistema DEVE [capacidade específica, ex: "permitir que usuários criem contas"]
- **RF-002**: Sistema DEVE [capacidade específica, ex: "validar endereços de email"]  
- **RF-003**: Usuários DEVEM poder [interação chave, ex: "redefinir sua senha"]
- **RF-004**: Sistema DEVE [requisito de dados, ex: "persistir preferências do usuário"]
- **RF-005**: Sistema DEVE [comportamento, ex: "registrar todos os eventos de segurança"]

*Exemplo de marcação de requisitos pouco claros:*

- **RF-006**: Sistema DEVE autenticar usuários via [PRECISA DE CLARIFICAÇÃO: método de autenticação não especificado - email/senha, SSO, OAuth?]
- **RF-007**: Sistema DEVE reter dados do usuário por [PRECISA DE CLARIFICAÇÃO: período de retenção não especificado]

### Entidades-Chave *(incluir se funcionalidade envolve dados)*

- **[Entidade 1]**: [O que representa, atributos chaves sem implementação]
- **[Entidade 2]**: [O que representa, relacionamentos com outras entidades]

