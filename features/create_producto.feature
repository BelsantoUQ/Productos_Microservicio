Feature: Crear un nuevo producto

        Scenario: Crear un producto exitosamente
            Given I provide all the required fields for a new product
             When I access the endpoint "/producto" with the provided fields
                  | id_produto | referencia | nombre | precio | descripcion | marca | categoria   | imagen_url  | stock |
                  | 1          | P123       | TV     | 500    | Una TV      | LG    | Electrónica | https://url | 10    |
             Then the new product should be created and returned

        Scenario: Crear producto con campos faltantes
            Given I provide some of the required fields for a new product
             When I access the endpoint "/producto" with the provided fields
             Then an error message should be returned

        Scenario: Crear producto con valores inválidos
            Given I provide some invalid fields for a new product
             When I access the endpoint "/producto" with the provided fields
             Then an error message should be returned
