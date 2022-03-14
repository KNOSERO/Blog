# Blog

## Uruchomienie projektu
1. Instalujemy 
    - Node.js
    - Docker
    - WSL
    - yarn
2. [Pobieramy repo](https://github.com/KNOSERO/mysql) i uruchamiamy dockera z bazą
3. Tworzymy plik `.env` z pliku `.env.template`
4. Wyszykujemy lokalizacje projektu w konsoli WSL
5. Uruchamiamy komende
```py
# develop
docker-compose -f docker-compose.dev.yaml up -d --build
#production 
docker-compose up -d --build
```