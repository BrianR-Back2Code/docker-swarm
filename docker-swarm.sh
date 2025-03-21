#!/bin/bash

# Swarm initialisieren
echo "Initialisiere Docker Swarm..."
docker swarm init 2>/dev/null

# Service erstellen
echo "Erstelle Nginx-Service mit 3 Replikaten..."
docker service create --name my-nginx --publish 8080:80 --replicas 3 nginx

# Warten, damit der Service startet
sleep 5

echo "Service-Status:"
docker service ls

echo "Laufende Container für my-nginx:"
docker service ps my-nginx

# Teste den Service
echo "Teste den Service mit curl..."
curl -I http://localhost:8080

# Skaliere den Service auf 5 Replikate
echo "Skaliere my-nginx auf 5 Replikate..."
docker service scale my-nginx=5

# Warten, damit Skalierung wirksam wird
sleep 5

echo "Aktueller Status nach Skalierung:"
docker service ps my-nginx

# Falls Service gestoppt werden soll
echo "Möchtest du den Service entfernen? (y/n)"
read -r response
if [[ "$response" == "y" ]]; then
    docker service rm my-nginx
    echo "Service my-nginx wurde entfernt."
else
    echo "Service my-nginx läuft weiter."
fi
