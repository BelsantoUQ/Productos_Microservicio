Feature: Obtener productos activos

        Escenario: Obtener productos activos existentes
            Dado que hay productos activos existentes en la empresa
             Cuando se hace una solicitud GET para obtener los productos activos
             Entonces la respuesta debe tener el código de estado 200
              Y el cuerpo de la respuesta debe tener una lista de los productos activos

        Escenario: No hay productos activos existentes
            Dado que no hay productos activos existentes en la empresa
             Cuando se hace una solicitud GET para obtener los productos activos
             Entonces la respuesta debe tener el código de estado 404
              Y el cuerpo de la respuesta debe tener un mensaje de error