# docker-swarm

## Aufgabe: Starte einen Nginx-Webserver im Swarm Mode Schritt 1: Swarm initialisieren
Starte einen Swarm-Manager

### Lokal
```sh
docker swarm init
```

## Schritt 2: Erstelle einen Service
- Starte einen einfachen Nginx-Webserver als Swarm-Service mit drei Replikaten:

```sh
docker service create --name my-nginx --publish 8080:80 --replicas 3 nginx
```
## Schritt 3: Überprüfe den Service
Sieh dir an, ob der Service läuft:
```sh
docker service ls
```

Überprüfe, welche Container laufen:

```sh
docker service ps my-nginx
```
## Schritt 4: Teste den Service

```sh
curl http://localhost:8080
```

## Schritt 5: Skaliere den Service
Erhöhe die Anzahl der Replikate auf fünf:
```sh
docker service scale my-nginx=5
```
Überprüfe erneut den Status:
```sh
docker service ps my-nginx
```

## Schritt 6: Lösche den Service
Falls du den Service beenden möchtest:
```sh
docker service rm my-nginx
```
