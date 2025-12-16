#!/bin/bash

# Substituir o IP no coordinator.py
if [ -n "$SERVER_IP" ]; then
    echo "Configurando IP do servidor para: $SERVER_IP"
    sed -i "s/192\.168\.1\.[0-9]\{1,3\}/$SERVER_IP/g" /app/GunBoundServer/coordinator.py
else
    echo "AVISO: SERVER_IP não definido. Usando IP padrão do arquivo."
    echo "Para configurar: docker run -e SERVER_IP=seu_ip ..."
fi

# Executar o servidor
python /app/GunBoundServer/coordinator.py
