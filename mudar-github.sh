#!/bin/bash

# Script para trocar o repositório GitHub
# Uso: ./mudar-github.sh USUARIO REPOSITORIO

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ Erro: Você precisa fornecer usuário e nome do repositório"
    echo ""
    echo "Uso: ./mudar-github.sh USUARIO NOME_DO_REPOSITORIO"
    echo ""
    echo "Exemplo: ./mudar-github.sh meuusuario meu-projeto"
    exit 1
fi

USERNAME=$1
REPO_NAME=$2

echo "🔄 Trocando repositório GitHub..."
echo "Novo repositório: $USERNAME/$REPO_NAME"
echo ""

# Remover remote atual
echo "📤 Removendo remote atual..."
git remote remove origin 2>/dev/null || echo "   (nenhum remote para remover)"

# Adicionar novo remote
echo "➕ Adicionando novo remote..."
git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git

# Verificar
echo ""
echo "✅ Remote configurado:"
git remote -v

echo ""
echo "📤 Fazendo push para o novo repositório..."
echo "   (Será pedido seu usuário e token)"
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Sucesso! Repositório conectado ao novo GitHub!"
    echo "🔗 URL: https://github.com/${USERNAME}/${REPO_NAME}"
else
    echo ""
    echo "⚠️  Erro ao fazer push. Verifique:"
    echo "   1. Se o repositório '$REPO_NAME' existe no GitHub"
    echo "   2. Se você tem acesso ao repositório"
    echo "   3. Se o token tem permissões corretas"
fi

