# Script de apoyo para ejecutar las consultas y guardar los resultados en un txt
import psycopg

CONEXION = "host=localhost port=5432 dbname=game_library user=postgres password=Alan123"

consultas = {
    "1. Todos los videojuegos": "SELECT id, title, genre, price, release_year, developer_id FROM games ORDER BY id;",
    "2. Videojuegos con precio mayor a $500": "SELECT title, price FROM games WHERE price > 500 ORDER BY price DESC;",
    "3. Videojuegos publicados despues de 2020": "SELECT title, release_year FROM games WHERE release_year > 2020 ORDER BY release_year;",
    "4. Videojuegos del genero RPG": "SELECT title, genre FROM games WHERE genre = 'RPG' ORDER BY title;",
    "5. Videojuegos del mas caro al mas barato": "SELECT title, price FROM games ORDER BY price DESC;",
    "6. Videojuegos de FromSoftware": "SELECT g.title, d.name AS developer FROM games g JOIN developers d ON g.developer_id = d.id WHERE d.name = 'FromSoftware' ORDER BY g.title;",
}

with psycopg.connect(CONEXION) as conn:
    with open(r"C:\Users\luisa\Desktop\tareas ssr\U2 T2\resultados_consultas.txt", "w", encoding="utf-8") as salida:
        for titulo, sql in consultas.items():
            salida.write("=" * 70 + "\n")
            salida.write(titulo + "\n")
            salida.write("SQL: " + sql + "\n")
            salida.write("-" * 70 + "\n")
            with conn.cursor() as cur:
                cur.execute(sql)
                columnas = [d.name for d in cur.description]
                filas = cur.fetchall()
                salida.write(" | ".join(columnas) + "\n")
                salida.write("-" * 70 + "\n")
                for fila in filas:
                    salida.write(" | ".join(str(v) for v in fila) + "\n")
                salida.write(f"({len(filas)} filas)\n\n")

print("Listo, resultados guardados en resultados_consultas.txt")
