#!/bin/bash

# Script para conectar repositório local ao GitHub
# Uso: ./conectar-github.sh NOME_DO_REPOSITORIO

REPO_NAME=$1
USERNAME="guilhermesimas542-lab"

if [ -z "$REPO_NAME" ]; then
    echo "❌ Erro: Você precisa fornecer o nome do repositório"
    echo "Uso: ./conectar-github.sh NOME_DO_REPOSITORIO"
    echo ""
    echo "Exemplo: ./conectar-github.sh redirect-espanha"
    exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  Aviso: Variável GITHUB_TOKEN não encontrada"
    echo "Configure com: export GITHUB_TOKEN=seu_token"
    echo "Ou será pedido ao fazer push"
fi

echo "🔗 Conectando ao repositório: $REPO_NAME"
echo ""

# Remover remote se já existir
git remote remove origin 2>/dev/null

# Adicionar remote (com ou sem token)
if [ -n "$GITHUB_TOKEN" ]; then
    git remote add origin https://${GITHUB_TOKEN}@github.com/${USERNAME}/${REPO_NAME}.git
else
    git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
fi

echo "✅ Remote adicionado com sucesso!"
echo ""
echo "📤 Fazendo push para o GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Sucesso! Repositório conectado ao GitHub!"
    echo "🔗 URL: https://github.com/${USERNAME}/${REPO_NAME}"
else
    echo ""
    echo "⚠️  Erro ao fazer push. Verifique:"
    echo "   1. Se o repositório '$REPO_NAME' existe no GitHub"
    echo "   2. Se o token tem permissões corretas"
    echo "   3. Se você tem acesso ao repositório"
fi

