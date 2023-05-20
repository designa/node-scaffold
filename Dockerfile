# Imagem base
FROM node:14

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar arquivos de dependências
COPY package.json .
COPY yarn.lock .

# Instalar dependências
RUN yarn install

# Copiar o código-fonte da aplicação
COPY . .

# Porta em que a aplicação será exposta
EXPOSE 3000

# Comando para executar a aplicação
CMD ["yarn", "dev"]
