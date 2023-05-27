import mysql.connector
from producto import Producto

class Empresa:
    def __init__(self):
        # Creamos una lista vacía para almacenar los productos
        self.productos = []

        # Configuramos la conexión a la base de datos
        self.cnx = mysql.connector.connect(
            user='root', password='root', host='mysql', port = "3306", database='productos_microservicio')
        print("DB connected")
        # Cargamos los productos desde la base de datos
        self.cargar_productos_desde_bd()

    def buscar_producto_por_id(self, id_producto):
        left, right = 0, len(self.productos) - 1
        while left <= right:
            middle = (left + right) // 2
            if self.productos[middle].id_producto == id_producto:
                return self.productos[middle]
            elif self.productos[middle].id_producto < id_producto:
                left = middle + 1
            else:
                right = middle - 1
        return None

    def actualizar_tabla_productos(self):
        cursor = self.cnx.cursor()
        # Actualizamos los productos existentes
        for producto in self.productos:
            query = f"UPDATE productos SET nombre='{producto.nombre}', precio={producto.precio}, descripcion='{producto.descripcion}', marca='{producto.marca}', categoria='{producto.categoria}', imagen_url='{producto.imagen_url}', stock={producto.stock}, estado_producto='{producto.estado_producto}' WHERE id_producto={producto.id_producto}"
            cursor.execute(query)

        # Añadimos los nuevos productos
        for producto in self.productos:
            query = f"SELECT COUNT(*) FROM productos WHERE id_producto={producto.id_producto}"
            cursor.execute(query)
            resultado = cursor.fetchone()[0]
            if resultado == 0:
                query = f"INSERT INTO productos (id_producto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, estado_producto) VALUES ({producto.id_producto}, '{producto.referencia}', '{producto.nombre}', {producto.precio}, '{producto.descripcion}', '{producto.marca}', '{producto.categoria}', '{producto.imagen_url}', {producto.stock}, '{producto.estado_producto}')"
                cursor.execute(query)

        self.cnx.commit()

    def cargar_productos_desde_bd(self):
        cursor = self.cnx.cursor()
        query = "SELECT id_producto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, estado_producto FROM productos"
        cursor.execute(query)
        productos_bd = cursor.fetchall()
        print(productos_bd)
        for producto_bd in productos_bd:
            id_producto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, estado_producto = producto_bd
            producto = Producto(id_producto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, estado_producto)
            self.productos.append(producto)