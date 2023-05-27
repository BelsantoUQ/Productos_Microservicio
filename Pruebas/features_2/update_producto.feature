Feature: Editar producto

        Scenario: Editar un producto exitosamente
            Given un token de acceso válido
             When se edita el producto con el ID 1 con los siguientes detalles:
                  | referencia  | nombre     | precio | descripcion         | marca   | categoria | imagen_url           | stock |
                  | REF001-EDIT | Producto 1 | 1200   | Descripción editada | Marca 2 | Categoria | https://imagen.com/2 | 20    |
             Then el servidor responde con el mensaje "Producto con ID 1 actualizado exitosamente."

        Scenario: Intentar editar un producto que no existe
            Given un token de acceso válido
             When se edita un producto con un ID inexistente
             Then el servidor responde con el mensaje "Producto no encontrado."
              And el estado de la respuesta es 404

        Scenario: Intentar editar un producto sin estar autenticado
             When se intenta editar el producto con el ID 1 con los siguientes detalles:
                  | referencia  | nombre     | precio | descripcion         | marca   | categoria | imagen_url           | stock |
                  | REF001-EDIT | Producto 1 | 1200   | Descripción editada | Marca 2 | Categoria | https://imagen.com/2 | 20    |
             Then el servidor responde con el mensaje "Token inválido"
              And el estado de la respuesta es 401