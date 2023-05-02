Feature: Obtener un producto por ID

        Scenario: Obtener producto existente
            Given I provide a valid product ID
             When I access the endpoint "/producto/{id}"
             Then I should receive the corresponding product object

        Scenario: Obtener producto inexistente
            Given I provide an invalid product ID
             When I access the endpoint "/producto/{id}"
             Then I should receive an error message
