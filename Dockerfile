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
