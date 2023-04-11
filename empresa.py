from producto import Producto

class Empresa:
    def __init__(self):
        # Creamos objetos de tipo Producto con referencia
        self.productos = [Producto(1, "PROD001", "Camiseta", 20.99, "Camiseta de algodón con diseño estampado", "Adidas", "Ropa", "https://imagenurl.com/camiseta-adidas.jpg", 10, 'A'),
                          Producto(2, "PROD002", "Zapatillas", 59.99, "Zapatillas deportivas con suela de goma", "Nike", "Calzado", "https://imagenurl.com/zapatillas-nike.jpg", 5, 'A'),
                          Producto(3, "PROD003", "Pantalones", 35.99, "Pantalones vaqueros de corte recto", "Levi's", "Ropa", "https://imagenurl.com/pantalones-levis.jpg", 20, 'I')]

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