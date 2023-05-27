Feature: Mensaje de bienvenida

        Escenario: Obtener mensaje de bienvenida
             Cuando se hace una solicitud GET a la raíz del servicio
             Entonces la respuesta debe tener el código de estado 200
              Y el cuerpo de la respuesta debe tener el mensaje de bienvenida