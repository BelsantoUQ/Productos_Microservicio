Feature: Actualizar un producto existente

        Scenario: Actualizar producto existente
            Given I provide a valid product ID and new fields
             When I access the endpoint "/producto" with the provided fields
             Then the corresponding product should be updated and a success message returned

        Scenario: Actualizar producto inexistente
            Given I provide an invalid product ID and new fields
             When I access the endpoint "/producto" with the provided fields
             Then an error message should be returned
