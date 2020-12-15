import os, subprocess

# Docker compose config
Docker_Compose = '''version: "2.1"
volumes:
  mongodb-data:
  mongodb-cfg:

services:
  frontend:
    container_name: frontend
    build: ./frontend
    restart: never
    depends_on:
      - backend
    ports:
      - 3000:3000

  backend:
    container_name: backend
    build: ./backend
    restart: unless-stopped
    depends_on:
      - db
    ports:
      - "80:80"

  db:
    container_name: db
    image: "mongo:latest"
    restart: unless-stopped
    environment:
      MONGO_INITDB_DATABASE: node-app
    ports:
      - "27017:27017"
    volumes:
      - "mongodb-data:/data/db"
      - "mongodb-cfg:/data/configdb"
    networks:
      - internal

networks:
  internal:
    driver: bridge
'''

# Write compose commands
with open("bin/docker-compose.yml", "w") as file:
    file.write(Docker_Compose)

# Push to balena
os.system('cd bin && balena push testapp')