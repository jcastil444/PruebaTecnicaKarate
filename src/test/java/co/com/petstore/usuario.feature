Feature: Gestionar un usuario

  Scenario: Crear un usuario
    Given url 'https://petstore.swagger.io/v2/user/createWithList'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request [{ "id": 100, "username": "jonacast", "firstName": "jonathan", "lastName": "castillo", "email": "jonathanpruebas4321@gmail.com", "password": "4321", "phone": "1234567890", "userStatus": 0 }]
    When method post
    Then status 200
    And match response == { "code": 200, "type": "unknown", "message": "ok" }

  Scenario: Buscar usuario
    Given url 'https://petstore.swagger.io/v2/user/jonacast'
    When method get
    Then status 200
    And match response.username == 'jonacast'
    And match response.firstName == 'jonathan'
    And match response.lastName == 'castillo'
    And match response.email == 'jonathanpruebas4321@gmail.com'

  Scenario: Actualizar usuario
    Given url 'https://petstore.swagger.io/v2/user/sofkamilo'
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request {"id": 100,"username": "jonacast","firstName": "alejandro","lastName": "pinzon","email": "alejandropruebas1234@gmail.com","password": "1234","phone": "1234567891","userStatus": 0}
    When method put
    Then status 200
    And match response contains { "code": 200, "type": "unknown" }

  Scenario: Buscar usuario
    Given url 'https://petstore.swagger.io/v2/user/jonacast'
    When method get
    Then status 200
    And match response.username == 'jonacast'
    And match response.firstName == 'alejandro'
    And match response.lastName == 'pinzon'
    And match response.email == 'alejandropruebas1234@gmail.com'

  Scenario: Eliminar usuario
    Given url 'https://petstore.swagger.io/v2/user/jonacast'
    And header accept = 'application/json'
    When method delete
    Then status 200
    And match response ==  {"code":200,"type":"unknown","message":"jonacast"}
