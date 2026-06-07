# Build trigger: deploy latest backend code
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY src ./src

# CloudBase Cloud Run injects PORT env var (default 8080)
EXPOSE ${PORT:-8080}

# Use node directly for proper signal handling in Cloud Run
CMD ["node", "src/index.js"]
