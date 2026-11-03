# Homelab
docker compose --env-file .env up -d
docker run --rm -v "$PWD":/app -w /app node:20-alpine sh -c "npm install && npm run build"
