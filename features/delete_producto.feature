Feature: Inactivar un producto existente

        Scenario: Inactivar producto existente
            Given I provide a valid product ID
             When I access the endpoint "/producto/{id}/inactivar"
             Then the corresponding product should be set to inactive and a success message returned

        Scenario: Inactivar producto inexistente
            Given I provide an invalid product ID
             When I access the endpoint "/producto/{id}/inactivar"
             Then an error message should be returned
