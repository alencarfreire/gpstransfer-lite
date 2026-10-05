# -------------------------------------------------------------
# Estágio 1: Builder (Compilação do Crystal)
# -------------------------------------------------------------
FROM crystallang/crystal:1.14.0-alpine AS builder

WORKDIR /app

# Copia primeiro os manifests de dependências para aproveitar cache de camadas
COPY shard.yml shard.lock ./
RUN shards install --production --frozen

# Copia o código-fonte, templates e assets estáticos
COPY . .

# Compila o binário otimizado para produção (--release ativa todas as otimizações do LLVM)
RUN crystal build src/server.cr --release --no-debug -o /app/bin/server

# -------------------------------------------------------------
# Estágio 2: Runner (Imagem final ultraleve: ~25MB)
# -------------------------------------------------------------
FROM alpine:3.20 AS runner

# Dependências mínimas de runtime para o binário Crystal em Alpine
RUN apk add --no-cache \
    gc \
    pcre2 \
    libevent \
    libssl3 \
    libcrypto3 \
    ca-certificates \
    tzdata

WORKDIR /app

# Cria usuário não-root por segurança
RUN adduser -D -u 1001 kemal && chown -R kemal:kemal /app
USER kemal

# Copia apenas o binário compilado e os arquivos públicos (imagens, favicons, robots, sitemap)
COPY --from=builder /app/bin/server /app/server
COPY --from=builder /app/public /app/public

ENV KEMAL_ENV=production
ENV PORT=3000

EXPOSE 3000

CMD ["/app/server", "-e", "production"]
