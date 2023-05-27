Feature: API de Productos

        Background:
            Given que el servidor está en funcionamiento

        Scenario: Inicio de sesión con credenciales válidas
            Given se tiene un usuario "admin" y una contraseña "admin" válidos
             When se hace una solicitud POST a "/login" con el usuario y la contraseña
             Then la respuesta debe tener el código de estado 200
              And el cuerpo de la respuesta debe tener un token válido

        Scenario: Inicio de sesión con credenciales inválidas
            Given se tiene un usuario o una contraseña inválidos
             When se hace una solicitud POST a "/login" con el usuario y la contraseña
             Then la respuesta debe tener el código de estado 401
              And el cuerpo de la respuesta debe tener un mensaje de error

        Scenario: Obtener todos los productos activos
             When se hace una solicitud GET a "/productos"
             Then la respuesta debe tener el código de estado 200
              And el cuerpo de la respuesta debe contener una lista de productos activos

        Scenario: Obtener un producto por su ID
            Given se tiene un ID de producto válido
             When se hace una solicitud GET a "/producto/{id}" con el ID de producto
             Then la respuesta debe tener el código de estado 200
              And el cuerpo de la respuesta debe contener los detalles del producto

        Scenario: Crear un nuevo producto
            Given se tienen los datos del nuevo producto
             When se hace una solicitud POST a "/producto" con los datos del producto
             Then la respuesta debe tener el código de estado 201
              And el cuerpo de la respuesta debe contener un mensaje de éxito y los detalles del nuevo producto

        Scenario: Actualizar un producto existente
            Given se tiene un ID de producto válido y los datos actualizados del producto
             When se hace una solicitud PUT a "/producto" con el ID de producto y los datos actualizados
             Then la respuesta debe tener el código de estado 200
              And el cuerpo de la respuesta debe contener un mensaje de éxito

