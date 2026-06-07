# CloudBase Cloud Run — builds from repo root, sources in backend/
FROM node:18-alpine

WORKDIR /app

# Install production dependencies only
COPY backend/package*.json ./
RUN npm install --omit=dev --ignore-scripts --no-audit --no-fund

# Copy source code
COPY backend/src ./src

# Ensure writable data directory for SQLite fallback (no PostgreSQL scenario)
RUN mkdir -p /app/data && chmod 777 /app/data

# CloudBase Cloud Run injects PORT env var (typically 8080)
EXPOSE 8080

CMD ["node", "src/index.js"]
