Feature: Crear producto

        Scenario: Crear un producto exitosamente
            Given un token de acceso válido
             When se crea un producto con los siguientes detalles:
                  | referencia | nombre     | precio | descripcion       | marca | categoria | imagen_url           | stock |
                  | REF001     | Producto 1 | 1000   | Descripción corta | Marca | Categoria | https://imagen.com/1 | 10    |
             Then el servidor responde con el mensaje "Producto creado exitosamente" y el detalle del producto creado
              And el estado de la respuesta es 201

        Scenario: Intentar crear un producto con campos faltantes
            Given un token de acceso válido
             When se crea un producto con campos faltantes:
                  | referencia | nombre     | precio | stock |
                  | REF001     | Producto 1 | 1000   | 10    |
             Then el servidor responde con el mensaje "No se pudo crear el producto."
              And el estado de la respuesta es 400

        Scenario: Intentar crear un producto sin estar autenticado
             When se intenta crear un producto con los siguientes detalles:
                  | referencia | nombre     | precio | descripcion       | marca | categoria | imagen_url           | stock |
                  | REF001     | Producto 1 | 1000   | Descripción corta | Marca | Categoria | https://imagen.com/1 | 10    |
             Then el servidor responde con el mensaje "Token inválido"
              And el estado de la respuesta es 401

        Scenario: Crear producto con valores inválidos
            Given proporciono algunos campos inválidos para un nuevo producto
             When  accedo al endpoint "/producto" con los campos proporcionados
             Then se debe devolver un mensaje de error
              And el estado de la respuesta es 400