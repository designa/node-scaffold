#!/bin/bash

# Pergunta o nome do projeto
read -p "Digite o nome do projeto: " project_name

# Cria o diretório com o nome do projeto e acessa-o
mkdir "$project_name"
cd "$project_name"

# Inicializa o projeto em TypeScript usando o yarn
yarn init -y

# Cria a estrutura de diretórios sugerida
mkdir src
mkdir src/controllers
mkdir src/models
mkdir src/services
mkdir src/routes
mkdir src/middlewares
mkdir src/utils

# Cria o arquivo tsconfig.json
echo '{
  "compilerOptions": {
    "target": "es2018",
    "module": "commonjs",
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true
  },
  "include": [
    "src"
  ]
}' > tsconfig.json

# Baixa o Dockerfile
curl -sS https://raw.githubusercontent.com/designa/node-scaffold/main/Dockerfile -o Dockerfile

# Baixa o arquivo docker-compose.yaml
curl -sS https://raw.githubusercontent.com/designa/node-scaffold/main/docker-compose.yml -o docker-compose.yaml

# Instala as dependências necessárias
yarn add express prisma fastify ts-node-dev typescript

echo "Projeto $project_name criado com sucesso!"