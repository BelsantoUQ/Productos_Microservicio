Feature: Obtener un producto

        Escenario: Obtener un producto existente
            Dado que hay un producto existente con el ID especificado
             Cuando se hace una solicitud GET para obtener el producto con el ID especificado
             Entonces la respuesta debe tener el código de estado 200
              Y el cuerpo de la respuesta debe tener el producto con el ID especificado

        Escenario: No hay un producto existente con el ID especificado
            Dado que no hay un producto existente con el ID especificado
             Cuando se hace una solicitud GET para obtener el producto con el ID especificado
             Entonces la respuesta debe tener el código de estado 404
              Y el cuerpo de la respuesta debe tener un mensaje de error