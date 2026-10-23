-- =============================================================
-- U2 T2: Base de datos para una biblioteca de videojuegos
-- Nombre de la base: game_library
-- Se ejecuta desde la terminal con psql -U postgres -h localhost
-- =============================================================

-- 1) Crear la base de datos
DROP DATABASE IF EXISTS game_library WITH (FORCE);
CREATE DATABASE game_library;

-- Conectarse a la base recien creada
\c game_library

-- 2) Crear las tablas
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS developers CASCADE;
DROP TABLE IF EXISTS platforms CASCADE;

CREATE TABLE developers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(60) NOT NULL,
    foundation_year INTEGER NOT NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    title VARCHAR(120) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    price NUMERIC(8,2) NOT NULL,
    release_year INTEGER NOT NULL,
    developer_id INTEGER NOT NULL REFERENCES developers(id)
);

CREATE TABLE platforms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    manufacturer VARCHAR(80) NOT NULL
);

-- 3) Insertar los desarrolladores (minimo 5)
INSERT INTO developers (name, country, foundation_year) VALUES
('Nintendo', 'Japon', 1889),
('Rockstar Games', 'Estados Unidos', 1998),
('CD Projekt Red', 'Polonia', 2002),
('FromSoftware', 'Japon', 1986),
('Valve', 'Estados Unidos', 1996);

-- 4) Insertar los videojuegos (minimo 15)
INSERT INTO games (title, genre, price, release_year, developer_id) VALUES
('The Legend of Zelda: Tears of the Kingdom', 'Accion-Aventura', 1399.00, 2023, 1),
('Super Mario Bros. Wonder', 'Plataformas', 1099.00, 2023, 1),
('Mario Kart 8 Deluxe', 'Carreras', 999.00, 2017, 1),
('Red Dead Redemption 2', 'Accion-Aventura', 899.00, 2018, 2),
('Grand Theft Auto V', 'Accion-Aventura', 499.00, 2013, 2),
('The Witcher 3: Wild Hunt', 'RPG', 799.00, 2015, 3),
('Cyberpunk 2077', 'RPG', 999.00, 2020, 3),
('Elden Ring', 'Accion RPG', 1299.00, 2022, 4),
('Dark Souls III', 'Accion RPG', 699.00, 2016, 4),
('Sekiro: Shadows Die Twice', 'Accion-Aventura', 849.00, 2019, 4),
('Half-Life 2', 'Shooter', 249.00, 2004, 5),
('Portal 2', 'Puzzle', 299.00, 2011, 5),
('Counter-Strike 2', 'Shooter', 399.00, 2023, 5),
('Thronebreaker: The Witcher Tales', 'RPG', 349.00, 2018, 3),
('Armored Core VI: Fires of Rubicon', 'Accion', 1199.00, 2023, 4);

-- 5) Insertar las plataformas (minimo 5)
INSERT INTO platforms (name, manufacturer) VALUES
('Nintendo Switch', 'Nintendo'),
('PlayStation 5', 'Sony'),
('Xbox Series X', 'Microsoft'),
('PC', 'Varias marcas'),
('Steam Deck', 'Valve');

-- =============================================================
-- 6) Consultas solicitadas
-- =============================================================

-- Consulta 1: Todos los videojuegos
SELECT * FROM games;

-- Consulta 2: Videojuegos con precio mayor a $500
SELECT title, price FROM games WHERE price > 500;

-- Consulta 3: Videojuegos publicados despues de 2020
SELECT title, release_year FROM games WHERE release_year > 2020;

-- Consulta 4: Videojuegos de un genero determinado (RPG)
SELECT title, genre FROM games WHERE genre = 'RPG';

-- Consulta 5: Videojuegos ordenados del mas caro al mas barato
SELECT title, price FROM games ORDER BY price DESC;

-- Consulta 6: Videojuegos de un desarrollador especifico (FromSoftware)
SELECT g.title, d.name AS developer
FROM games g
JOIN developers d ON g.developer_id = d.id
WHERE d.name = 'FromSoftware';
