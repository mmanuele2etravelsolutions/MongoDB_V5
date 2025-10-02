#!/bin/bash

# Nombre del contenedor
CONTAINER_NAME="mongodb"

# Ruta segura en el host para los datos persistentes
HOST_VOLUME_PATH="/var/lib/docker-volumes/mongodb-data"

# Crear la carpeta si no existe
sudo mkdir -p "$HOST_VOLUME_PATH"

# Establecer permisos adecuados para el usuario dentro del contenedor (UID 999 suele ser mongodb)
sudo chown -R 999:999 "$HOST_VOLUME_PATH"

# Lanzar MongoDB 5 usando Docker
docker run -d \
  --name $CONTAINER_NAME \
  -p 27017:27017 \
  -v "$HOST_VOLUME_PATH":/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=ALGO \
  -e MONGO_INITDB_ROOT_PASSWORD=ALGO1234 \
  --restart unless-stopped \
  mongo:5
