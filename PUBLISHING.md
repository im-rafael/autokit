# Guia de Publicação do iAutokit

## Pré-requisitos

1. Conta no npm (crie em https://www.npmjs.com/signup se não tiver)
2. Node.js instalado (versão 14+)

## Passo a Passo para Publicar

### 1. Fazer Login no npm

```bash
npm login
```

Você será solicitado a fornecer:

- Username (seu nome de usuário npm)
- Password (sua senha)
- Email (email vinculado à conta npm)
- OTP (se você tiver autenticação de dois fatores habilitada)

### 2. Verificar se o Nome do Pacote Está Disponível

```bash
npm view iautokit
```

Se retornar "404", o nome está disponível. Caso contrário, escolha outro nome.

### 3. Testar o Pacote Localmente

```bash
# Criar link simbólico global
npm link

# Em outro diretório de teste
cd /tmp/test-project
iautokit

# Verificar se funcionou corretamente
```

### 4. Publicar o Pacote

```bash
# Volte para o diretório do iautokit
cd /home/wisiex/autokit

# Publique (primeira vez)
npm publish
```

**Nota**: Pacotes sem escopo são públicos por padrão.

### 5. Verificar a Publicação

```bash
npm view iautokit
```

### 6. Testar a Instalação

```bash
# Em outro diretório
npx iautokit
```

## Atualizações Futuras

Para publicar novas versões:

```bash
# Atualizar versão (escolha um: patch, minor, major)
npm version patch  # 1.0.0 -> 1.0.1
npm version minor  # 1.0.1 -> 1.1.0
npm version major  # 1.1.0 -> 2.0.0

# Publicar
npm publish
```

## Remover Link Local (após testar)

```bash
npm unlink -g iautokit
```

## Troubleshooting

### Erro: Need Auth

- Faça login novamente: `npm login`

### Erro: Package name already exists

- Use outro nome
- Ou adicione um escopo (ex: `@seu-usuario/iautokit`)

### Erro: EPUBLISHCONFLICT

- A versão já foi publicada
- Atualize a versão no package.json antes de publicar novamente
