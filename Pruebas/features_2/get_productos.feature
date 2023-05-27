Feature: Obtener todos los productos

        Escenario: Obtener todos los productos existentes
            Dado que hay productos existentes en la empresa
             Cuando se hace una solicitud GET para obtener todos los productos
             Entonces la respuesta debe tener el código de estado 200
              Y el cuerpo de la respuesta debe tener una lista de todos los productos

        Escenario: No hay productos existentes
            Dado que no hay productos existentes en la empresa
             Cuando se hace una solicitud GET para obtener todos los productos
             Entonces la respuesta debe tener el código de estado 404
              Y el cuerpo de la respuesta debe tener un mensaje de error