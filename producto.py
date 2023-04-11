class Producto:
    def __init__(self, id_producto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, estado):
        
        self.id_producto = id_producto
        self.referencia = referencia
        self.nombre = nombre
        self.precio = precio
        self.descripcion = descripcion
        self.marca = marca
        self.categoria = categoria
        self.imagen_url = imagen_url
        self.stock = stock
        self.estado = estado

    def mostrar_info(self):
        print("Referencia:", self.referencia)
        print("Nombre:", self.nombre)
        print("Marca:", self.marca)
        print("Categoría:", self.categoria)
        print("Precio:", self.precio)
        print("Descripción:", self.descripcion)
        print("Imagen URL:", self.imagen_url)
        print("Stock:", self.stock)
        print("Estado:", self.estado)