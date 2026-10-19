# ==========================================
# Estágio 1: Build (compilação TypeScript)
# ==========================================
FROM node:22-alpine AS builder

WORKDIR /app

# Instala dependências primeiro para aproveitar o cache de camadas
COPY package*.json ./
RUN npm ci

# Copia arquivos de configuração e código fonte
COPY tsconfig.json tsconfig.frontend.json ./
COPY src/ ./src/
COPY public/ ./public/

# Compila o backend (dist/) e o frontend (public/js/)
RUN npm run build

# ==========================================
# Estágio 2: Runner (imagem enxuta de produção)
# ==========================================
FROM node:22-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production

# Instala apenas as dependências de produção
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

# Copia código compilado e arquivos públicos do estágio de build
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/public ./public

# Usuário sem privilégios de root para segurança
USER node

# Porta padrão da aplicação
EXPOSE 3000

# Executa diretamente o servidor compilado
CMD ["node", "dist/server.js"]
