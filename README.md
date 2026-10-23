# U2 T2 - Base de datos game_library

Practica de PostgreSQL desde la terminal. Se crea una base de datos para una biblioteca de videojuegos.

## Contenido

- `game_library.sql`: crea la base, las tablas, inserta los datos y ejecuta las consultas.
- `consultas.py`: script de apoyo que repite las consultas y guarda el resultado en un txt.
- `resultados_consultas.txt`: salida real de las 6 consultas.

## Tablas

- `developers`: id, name, country, foundation_year.
- `games`: id, title, genre, price, release_year, developer_id (llave foranea a developers.id).
- `platforms`: id, name, manufacturer.

## Datos insertados

- 5 desarrolladores.
- 15 videojuegos.
- 5 plataformas.

## Como ejecutarlo

```powershell
psql -U postgres -h localhost -f game_library.sql
```

(Pide la contraseña del superusuario postgres.)

## Consultas que se realizan

1. Todos los videojuegos.
2. Videojuegos con precio mayor a $500.
3. Videojuegos publicados despues de 2020.
4. Videojuegos de un genero determinado (RPG).
5. Videojuegos ordenados del mas caro al mas barato.
6. Videojuegos de un desarrollador especifico (FromSoftware).
