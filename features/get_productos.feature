Feature: Obtener todos los productos

        Scenario: Obtener lista de todos los productos
            Given I access the endpoint "/productos/all"
             Then I should receive a list of all products
