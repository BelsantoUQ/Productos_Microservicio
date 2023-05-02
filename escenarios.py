from behave import given, when, then
from empresa import Empresa
from producto import Producto

@given("que existen productos en la base de datos")
def step_impl(context):
    context.mi_empresa = Empresa()
    context.mi_empresa.productos.append(Producto(1, "P123", "TV", 500, "Una TV", "LG", "Electrónica", "https://url", 10, "A"))

@when("se crea un nuevo producto con los siguientes datos:")
def step_impl(context, id_produto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock):
    context.mi_empresa.productos.append(Producto(id_produto, referencia, nombre, precio, descripcion, marca, categoria, imagen_url, stock, "A"))
    context.mi_empresa.actualizar_tabla_productos()

@then("el producto se crea exitosamente")
def step_impl(context):
    assert len(context.mi_empresa.productos) == 2