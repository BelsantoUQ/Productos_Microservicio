from fastapi import Depends, Body, FastAPI, HTTPException
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
# from empresa import Empresa
from producto import Producto
from jwt import encode, decode, InvalidTokenError, ExpiredSignatureError
from datetime import datetime, timedelta
import secrets

clave_secreta = secrets.token_hex(16)
app = FastAPI()
app.title = "Productos (Universidad del Qundío)"
app.version = "0.0.1"
# mi_empresa = Empresa()

security = HTTPBearer()

def verificar_token(token: str = Depends(security)):
    try:
        payload = decode(token.credentials, clave_secreta, algorithms=["HS256"])
        usuario = payload["usuario"]
        expiracion = datetime.utcfromtimestamp(payload["exp"])
        if expiracion > datetime.utcnow():
            return usuario
        else:
            raise HTTPException(status_code=401, detail="Token expirado")
    except ExpiredSignatureError:
        raise HTTPException(status_code=401, detail="Token expirado")
    except InvalidTokenError:
        raise HTTPException(status_code=401, detail="Token inválido")

@app.get('/', tags=['home'])
def message():
    return {"message": "API Restful de productos \n Creado por estudiantes de la Universidad del Quindío"}

@app.post('/login', tags=['autenticación'])
def login(usuario: str, contrasena: str):
    try:
        if usuario == 'admin' and contrasena == 'admin':
            token = encode({
                'usuario': usuario,
                'exp': datetime.utcnow() + timedelta(hours=1)
            }, clave_secreta, algorithm='HS256')
            return {
            'mensaje': 'Inicio de sesión exitoso',
            'token': token
        }
        else:
            raise HTTPException(status_code=401, detail='Credenciales inválidas')
    except Exception as e:
        return {'error': str(e)}

# @app.get('/productos', tags=['productos'])
# def get_productos_activos():
#     productos_activos = [p for p in mi_empresa.productos if p.estado == 'A']
#     if len(productos_activos) == 0:
#         raise HTTPException(status_code=404, detail="No se encontraron productos activos.")
#     return productos_activos

# @app.get('/productos/all', tags=['todos los productos'])
# def get_productos():
#     if len(mi_empresa.productos) == 0:
#         raise HTTPException(status_code=404, detail="No se encontraron productos.")
#     return mi_empresa.productos

# @app.get('/producto/{id}', tags=['producto'])
# def get_producto(id_producto: int):
#     producto = mi_empresa.buscar_producto_por_id(id_producto)
#     if not producto:
#         raise HTTPException(status_code=404, detail="No se encontraron productos.")
#     return producto

# @app.post('/producto', tags=['crear producto'])
# def create_producto(referencia: str = Body(), nombre: str = Body(), precio: int = Body(), descripcion: str = Body(), marca: str = Body(), categoria: str = Body(), imagen_url: str = Body(), stock: int = Body(), usuario: str = Depends(verificar_token)):
#     try:
#         nuevo_producto = Producto('0',referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, 'A')
#         mi_empresa.productos.append(nuevo_producto)
#         mi_empresa.actualizar_tabla_productos()
#         return {"message": "Producto creado exitosamente", "producto": nuevo_producto}, 201
#     except Exception as e:
#         error_message = str(e)
#         raise HTTPException(status_code=400, detail="No se pudo crear el producto."+ error_message)

# @app.put('/producto', tags=['editar producto'])
# def update_producto(id_producto: int = Body(), referencia: str = Body(), nombre: str = Body(), precio: int = Body(), descripcion: str = Body(), marca: str = Body(), categoria: str = Body(), imagen_url: str = Body(), stock: int = Body(), usuario: str = Depends(verificar_token)):
#     for i, p in enumerate(mi_empresa.productos):
#         if p.id_producto == id_producto:
#             mi_empresa.productos[i] = Producto(id_producto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, 'A')
#             mi_empresa.actualizar_tabla_productos()
#             return {"message": f"Producto con ID {id_producto} actualizado exitosamente."}
#     return {"error": "Producto no encontrado."}, 404

# @app.delete('/producto/{id}', tags=['eliminar producto'])
# def delete_producto(id: int, usuario: str = Depends(verificar_token)):
#     for i, p in enumerate(mi_empresa.productos):
#         if p.id_producto == id:
#             if p.estado == 'A':
#                 p.estado = 'I'
#                 mi_empresa.actualizar_tabla_productos()
#                 return {"message": f"Producto con ID {id} eliminado exitosamente."}
#             else:
#                 raise HTTPException(status_code=400, detail="El producto ya está inactivo.")
#     raise HTTPException(status_code=404, detail="Producto no encontrado.")