Feature: Eliminar producto

  Como usuario autenticado en la API de productos
  Quiero eliminar un producto existente en mi empresa
  Para mantener actualizada la información de mi catálogo

        Scenario: Eliminar producto existente
            Given que el usuario está autenticado en la API con un token válido
              And hay un producto existente con id 1
             When el usuario envía una solicitud DELETE a "/producto/1"
             Then la respuesta debe tener el código de estado 204
              And el producto con id 1 no debe estar en la lista de productos de la empresa

        Scenario: Eliminar producto inexistente
            Given que el usuario está autenticado en la API con un token válido
              And no hay un producto existente con id 999
             When el usuario envía una solicitud DELETE a "/producto/999"
             Then la respuesta debe tener el código de estado 404
              And la respuesta debe contener el mensaje "No se encontró el producto."
