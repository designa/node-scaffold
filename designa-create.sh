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
mkdir environment

# Define o nome do projeto e do ambiente
project_name=$(echo "$project_name" | tr '[:upper:]' '[:lower:]')
environment_names=("development" "production" "internal" "staging")

# Loop para criar os arquivos de ambiente com os respectivos valores
for environment_index in "${!environment_names[@]}"; do
  environment_name="${environment_names[$environment_index]}"
  environment_file="environment/environment.$environment_name.ts"
  is_production=false

  if [[ $environment_index == 1 ]]; then
    is_production=true
  fi

echo "export const environment = {
  apiUrl: \"http://localhost:3000\",
  name: \"$project_name\",
  env: \"$environment_name\",
  production: $is_production
};" > "$environment_file"
done

mv environment/environment.development.ts environment/environment.ts

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
    "src",
    "environment"
  ],
  "files": [
    "environment/environment.ts"
  ]
}' > tsconfig.json

# Baixa o Dockerfile
curl -sS https://raw.githubusercontent.com/designa/node-scaffold/main/Dockerfile -o Dockerfile

# Baixa o arquivo docker-compose.yaml
curl -sS https://raw.githubusercontent.com/designa/node-scaffold/main/docker-compose.yml -o docker-compose.yaml

echo 'import express, { Request, Response } from "express";
import { environment } from "../environment/environment";

const port = 3000;
const app = express();

const { name, env, production, apiUrl } = environment

app.get("/", (_: Request, res: Response) => {
  res.json({ name, env, production, apiUrl, status: 200 });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});' > src/index.ts

# Instala as dependências necessárias
yarn add express prisma fastify ts-node-dev typescript

# Adiciona os scripts ao package.json
cat package.json | jq '.scripts += {
  "start": "node dist/index.js",
  "dev": "ts-node-dev --respawn --transpile-only src/index.ts",
  "build": "tsc",
  "test": "echo \"No tests yet\""
}' > temp.json && mv temp.json package.json

echo "Projeto $project_name criado com sucesso!"

cd "$project_name"
yarn dev
