Feature: Obtener todos los productos activos

        Scenario: Obtener lista de productos activos
            Given I access the endpoint "/productos"
             Then I should receive a list of all active products
