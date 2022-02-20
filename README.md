# Blog

## Development
Aby uruchomić aplikacje na win musimy mieć zainstalowany
- Node.js
- Docker
- WSL
- yarn

Potem uruchamiamy w konsoli WSL w folderze programu
```
docker-compose -f docker-compose.dev.yaml up -d --build
```

## Produkcja