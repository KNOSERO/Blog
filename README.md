# Blog

## Uruchomienie projektu
1. Instalujemy 
    - Node.js
    - Docker
    - WSL
    - yarn
2. Tworzymy plik `.env` z pliku `.env.template`
3. Wyszykujemy lokalizacje projektu w konsoli WSL
4. Uruchamiamy komende
```py
# develop
docker-compose -f docker-compose.dev.yaml up -d --build
#production 
docker-compose up -d --build
```