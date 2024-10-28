# Usar uma imagem oficial do Node.js como base
FROM node:18-alpine

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o package.json e o package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instalar as dependências do projeto
RUN npm install

# Copiar o restante do projeto para o contêiner
COPY . .

# Rodar o build do Vite
RUN npm run build

# Instalar o servidor estático serve
RUN npm install -g serve

# Expor a porta que o contêiner vai utilizar
EXPOSE 3000

# Comando para rodar o servidor usando serve
CMD ["serve", "-s", "dist", "-l", "3000"]
