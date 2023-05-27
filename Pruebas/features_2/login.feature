Feature: Inicio de sesión

        Escenario: Iniciar sesión con credenciales válidas
            Dado que se tiene un usuario y una contraseña válidos
             Cuando se hace una solicitud POST para iniciar sesión con el usuario y la contraseña
             Entonces la respuesta debe tener el código de estado 200
              Y el cuerpo de la respuesta debe tener un token válido

        Escenario: Iniciar sesión con credenciales inválidas
            Dado que se tiene un usuario o una contraseña inválidos
             Cuando se hace una solicitud POST para iniciar sesión con el usuario y la contraseña
             Entonces la respuesta debe tener el código de estado 401
              Y el cuerpo de la respuesta debe tener un mensaje de error