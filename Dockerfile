# CloudBase Cloud Run — builds from repo root, sources in backend/
FROM node:18-alpine

WORKDIR /app

COPY backend/package*.json ./

RUN npm ci --only=production

COPY backend/src ./src

# CloudBase Cloud Run injects PORT env var (default 8080)
EXPOSE 8080

CMD ["node", "src/index.js"]
