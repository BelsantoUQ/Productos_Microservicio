from fastapi import FastAPI, Body
from fastapi.responses import HTMLResponse
from empresa import Empresa
from producto import Producto

app = FastAPI()
app.title = "Productos Universidad del Qundío"
app.version = "0.0.1"
mi_empresa = Empresa()

@app.get('/', tags=['home'])
def message():
    return HTMLResponse("Api productos")

@app.get('/productos/todos', tags=['todos los productos'])
def get_productos():
    return mi_empresa.productos

@app.get('/productos/{id}', tags=['producto'])
def get_producto(id_produto: int):
    return mi_empresa.buscar_producto_por_id(id_produto)

@app.get('/producto/', tags=['producto 2'])
def get_produto_by_id(id_produto: int):
    return mi_empresa.buscar_producto_por_id(id_produto)

@app.post('/producto', tags=['crear producto'])
def create_producto(id_produto: int = Body(), referencia: str = Body(), nombre: str = Body(), precio: int = Body(), descripcion: str = Body(), marca: str = Body(), categoria: str = Body(), imagen_url: str = Body(), stock: int = Body()):
    mi_empresa.productos.append(Producto(id_produto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, 'A'))
    return mi_empresa.productos

@app.put('/producto/{id}', tags=['editar producto'])
def update_producto(id_produto: int = Body(), referencia: str = Body(), nombre: str = Body(), precio: int = Body(), descripcion: str = Body(), marca: str = Body(), categoria: str = Body(), imagen_url: str = Body(), stock: int = Body()):
    for i, p in enumerate(mi_empresa.productos):
        if p.id_produto == id:
            mi_empresa.productos[i] = Producto(id_produto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, 'A')
            return {"message": f"Producto con ID {id} actualizado exitosamente."}
    return {"error": "Producto no encontrado."}

@app.put('/producto/{id}/inactivar', tags=['inactivar producto'])
def update_producto_estado(id: int):
    for i, p in enumerate(mi_empresa.productos):
        if p.id_producto == id:
            mi_empresa.productos[i].estado = 'I'
            return {"message": f"Estado del producto con ID {id} actualizado a Inactivo."}
    return {"error": "Producto no encontrado."}

@app.get('/productos', tags=['productos'])
def get_productos_activos():
    productos_activos = []
    for p in mi_empresa.productos:
        if p.estado == "A":
            productos_activos.append(p)
    return productos_activos