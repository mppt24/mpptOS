
#!/bin/bash

# Configuração inicial
REPO_NAME="mpptOS"
USER_GITHUB="mppt24"

# Cria diretório do projeto
mkdir -p "$REPO_NAME"
cd "$REPO_NAME"

# Criação de README
echo "# mpptOS\nSistema criado por mppt24 para servir a humanidade." > README.md

# Download dos ficheiros necessários (index, zip e docs)
curl -O https://chatgpt-files.openai.com/mpptOS_PUBLICACAO_FINAL.zip

# Descompacta o zip
unzip mpptOS_PUBLICACAO_FINAL.zip

# Inicializa repositório git e faz commit
git init
git add .
git commit -m "Publicação inicial do projeto mpptOS"

# Cria repositório no GitHub usando SSH
gh repo create "$USER_GITHUB/$REPO_NAME" --public --source=. --push

# Ativa GitHub Pages
gh repo edit "$USER_GITHUB/$REPO_NAME" --enable-pages --pages-branch main --pages-path /

echo "✅ Publicado com sucesso!"
echo "🌐 Acede em: https://$USER_GITHUB.github.io/$REPO_NAME"
