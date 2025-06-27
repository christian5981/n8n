<<<<<<< HEAD
# Etapa 1: construcción
FROM node:18-alpine AS build

WORKDIR /app

RUN apk add --no-cache python3 make g++

COPY . .

RUN yarn install --frozen-lockfile && yarn build

# Etapa 2: imagen final optimizada
FROM node:18-alpine

WORKDIR /app

COPY --from=build /app /app

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

EXPOSE 5678

CMD ["yarn", "start"]
=======
# Dockerfile para n8n con SQLite + autenticación básica
FROM n8nio/n8n

# Define las variables de entorno
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=christian5981
ENV N8N_BASIC_AUTH_PASSWORD=Reaper598.1#

# Usa SQLite y guarda los datos en una carpeta persistente
ENV DB_TYPE=sqlite
ENV DB_SQLITE_LOCATION=/home/node/.n8n/database.sqlite

# Ruta persistente para workflows, credenciales y base de datos
VOLUME /home/node/.n8n


>>>>>>> b9feb03af (Agrega Dockerfile con SQLite y autenticación básica)
