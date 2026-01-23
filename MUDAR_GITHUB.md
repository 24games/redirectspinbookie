# 🔄 Como Mudar para Outro Repositório GitHub

## 📋 Situação Atual
- **Repositório atual**: `guilhermesimas542-lab/Redirect-SpinBook`
- **Branch**: `main`
- **Commits**: 4 commits locais

---

## 🎯 OPÇÃO 1: Trocar o Remote (Substituir o repositório atual)

Se você quer **substituir completamente** o repositório atual por um novo:

### Passo 1: Criar o novo repositório no GitHub
1. Acesse: https://github.com/new
2. Dê um nome ao repositório
3. Escolha público ou privado
4. **NÃO** marque "Initialize with README"
5. Clique em "Create repository"

### Passo 2: Remover o remote atual e adicionar o novo
```bash
# Remover o remote atual
git remote remove origin

# Adicionar o novo remote (substitua pelo seu novo repositório)
git remote add origin https://github.com/SEU_USUARIO/NOVO_REPOSITORIO.git

# Verificar
git remote -v

# Fazer push para o novo repositório
git push -u origin main
```

---

## 🎯 OPÇÃO 2: Adicionar um Segundo Remote (Manter ambos)

Se você quer manter o repositório atual **E** adicionar um novo:

### Passo 1: Criar o novo repositório no GitHub
(Same as Opção 1)

### Passo 2: Adicionar como segundo remote
```bash
# Adicionar novo remote com nome diferente (ex: "new-origin")
git remote add new-origin https://github.com/SEU_USUARIO/NOVO_REPOSITORIO.git

# Verificar todos os remotes
git remote -v

# Fazer push para o novo repositório
git push -u new-origin main
```

**Para fazer push no futuro:**
- Repositório antigo: `git push origin main`
- Repositório novo: `git push new-origin main`

---

## 🎯 OPÇÃO 3: Criar um Novo Repositório Limpo (Sem histórico)

Se você quer começar do zero em um novo repositório:

### Passo 1: Criar o novo repositório no GitHub
(Same as Opção 1)

### Passo 2: Remover o histórico Git e começar novo
```bash
# Remover o diretório .git (cuidado: isso apaga todo o histórico!)
rm -rf .git

# Inicializar novo repositório
git init

# Adicionar todos os arquivos
git add .

# Fazer commit inicial
git commit -m "Initial commit"

# Adicionar o novo remote
git remote add origin https://github.com/SEU_USUARIO/NOVO_REPOSITORIO.git

# Fazer push
git push -u origin main
```

⚠️ **ATENÇÃO**: Esta opção apaga todo o histórico de commits!

---

## 🔐 Autenticação

Quando fizer `git push`, será pedido:
- **Username**: seu usuário do GitHub
- **Password**: use um **Personal Access Token** (não sua senha)

Se ainda não tem um token:
1. Acesse: https://github.com/settings/tokens
2. Generate new token (classic)
3. Selecione escopo: `repo`
4. Copie o token e use como senha

---

## ✅ Verificação

Após fazer push, verifique:
```bash
# Ver remotes configurados
git remote -v

# Ver status
git status

# Ver commits
git log --oneline
```

---

## 💡 Recomendação

**Use a OPÇÃO 1** se você quer simplesmente trocar de repositório mantendo o histórico.

**Use a OPÇÃO 2** se você quer manter ambos os repositórios sincronizados.

**Use a OPÇÃO 3** apenas se realmente quiser começar do zero sem histórico.

