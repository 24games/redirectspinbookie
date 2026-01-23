# 📚 Guia Completo: Conectar GitHub ao Projeto

## ⚙️ PRÉ-REQUISITOS

### 1. Configurar Git (OBRIGATÓRIO - Primeira vez apenas)
```bash
git config --global user.name "Seu Nome Completo"
git config --global user.email "seu.email@exemplo.com"
```

---

## 🔐 MÉTODO 1: HTTPS (Mais Simples)

### Passo 1: Criar Personal Access Token (PAT)
1. Acesse: https://github.com/settings/tokens
2. Clique em **"Generate new token"** → **"Generate new token (classic)"**
3. Dê um nome descritivo (ex: "Redirect Espanha")
4. Selecione escopo: **`repo`** (marca todas as opções de repo)
5. Clique em **"Generate token"**
6. **COPIE O TOKEN** (você só verá uma vez! Guarde em local seguro)

### Passo 2: Criar Repositório no GitHub
1. Acesse: https://github.com/new
2. Dê um nome ao repositório (ex: "redirect-espanha")
3. Escolha se será público ou privado
4. **NÃO** marque "Initialize with README" (já temos arquivos)
5. Clique em **"Create repository"**

### Passo 3: Conectar Repositório Local ao GitHub
```bash
# 1. Inicializar Git (se ainda não fez)
git init

# 2. Adicionar todos os arquivos
git add .

# 3. Fazer primeiro commit
git commit -m "Initial commit"

# 4. Adicionar remote (substitua SEU_USUARIO e SEU_REPOSITORIO)
git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git

# 5. Renomear branch para main (se necessário)
git branch -M main

# 6. Fazer push
git push -u origin main
# Quando pedir:
#   Username: seu_usuario_github
#   Password: COLE O TOKEN AQUI (não sua senha!)
```

---

## 🔑 MÉTODO 2: SSH (Recomendado para uso contínuo)

### Passo 1: Verificar se já tem chave SSH
```bash
ls -la ~/.ssh/id_*.pub
```

### Passo 2: Gerar Nova Chave SSH
```bash
# Gerar chave (substitua pelo seu email do GitHub)
ssh-keygen -t ed25519 -C "seu.email@exemplo.com"

# Quando perguntar:
# - Onde salvar: Pressione Enter (usa ~/.ssh/id_ed25519)
# - Senha: Pode deixar vazio ou criar uma senha forte
```

### Passo 3: Adicionar Chave ao SSH Agent
```bash
# Iniciar ssh-agent
eval "$(ssh-agent -s)"

# Adicionar chave
ssh-add ~/.ssh/id_ed25519
```

### Passo 4: Copiar Chave Pública
```bash
# Exibir chave pública
cat ~/.ssh/id_ed25519.pub
# Copie TODO o conteúdo exibido
```

### Passo 5: Adicionar Chave no GitHub
1. Acesse: https://github.com/settings/keys
2. Clique em **"New SSH key"**
3. Dê um título (ex: "MacBook Pro")
4. Cole a chave copiada no campo "Key"
5. Clique em **"Add SSH key"**

### Passo 6: Testar Conexão SSH
```bash
ssh -T git@github.com
# Deve aparecer: "Hi SEU_USUARIO! You've successfully authenticated..."
```

### Passo 7: Conectar Repositório
```bash
# 1. Inicializar Git
git init

# 2. Adicionar arquivos
git add .

# 3. Primeiro commit
git commit -m "Initial commit"

# 4. Adicionar remote SSH (substitua SEU_USUARIO e SEU_REPOSITORIO)
git remote add origin git@github.com:SEU_USUARIO/SEU_REPOSITORIO.git

# 5. Renomear branch
git branch -M main

# 6. Fazer push
git push -u origin main
```

---

## 🔄 COMANDOS ÚTEIS APÓS CONECTAR

### Verificar status
```bash
git status
```

### Ver remote configurado
```bash
git remote -v
```

### Adicionar e fazer commit
```bash
git add .
git commit -m "Descrição das mudanças"
git push
```

### Baixar mudanças do GitHub
```bash
git pull
```

### Ver histórico de commits
```bash
git log --oneline
```

---

## ❓ TROUBLESHOOTING

### Erro: "remote origin already exists"
```bash
# Remover remote existente
git remote remove origin

# Adicionar novamente
git remote add origin [URL_DO_SEU_REPOSITORIO]
```

### Erro: "failed to push some refs"
```bash
# Se o GitHub criou README, você precisa fazer pull primeiro
git pull origin main --allow-unrelated-histories
git push -u origin main
```

### Erro de autenticação HTTPS
- Certifique-se de usar o **token** (PAT), não sua senha
- Tokens expiram? Crie um novo em: https://github.com/settings/tokens

### Erro de autenticação SSH
```bash
# Testar conexão
ssh -T git@github.com

# Se não funcionar, verificar se chave está no agent
ssh-add -l

# Adicionar chave novamente
ssh-add ~/.ssh/id_ed25519
```

---

## 📝 NOTAS IMPORTANTES

- **HTTPS**: Mais fácil, mas precisa digitar token a cada push (ou configurar credential helper)
- **SSH**: Configuração inicial mais trabalhosa, mas depois é automático
- **Token PAT**: Guarde em local seguro, você só vê uma vez ao criar
- **Chave SSH**: Nunca compartilhe a chave privada (~/.ssh/id_ed25519), apenas a pública

---

## 🚀 PRÓXIMOS PASSOS

Depois de conectar:
1. Crie um `.gitignore` para não commitar arquivos desnecessários
2. Faça commits frequentes com mensagens descritivas
3. Considere criar branches para features diferentes
4. Use pull requests para revisar código antes de merge

