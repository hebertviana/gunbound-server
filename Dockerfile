FROM python:3.6-slim

WORKDIR /app

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório para dados persistentes
RUN mkdir -p /app/data

# Clonar o repositório
COPY . .

# Instalar dependências do Python

RUN pip install -r GunBoundServer/requirements.txt



# Expor portas (ajuste conforme necessário)
# Broker: 8370, Game Server: 8371 (portas padrão mencionadas no código)
EXPOSE 8370 8371

# Script para configurar IP dinamicamente
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]