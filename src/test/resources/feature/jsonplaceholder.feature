Feature: Gestión de publicaciones en JSONPlaceholder

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * def postId = 0
    * configure ssl = true

  @Crear
  Scenario: 1. Crear una nueva publicación (POST) y guardar su ID
    Given path '/posts/'
    And request read('classpath:data/post.json')
    When method POST
    Then status 201
    And match response == { id: '#number', title: '#string', body: '#string', userId: '#number' }
    And match response.title == 'Curso Automatizacion'
    And def postId = response.id
    * print 'ID de la publicación creada:', postId


  @Actualizar
  Scenario: 2. Actualizar una publicación existente (PUT)
    Given path '/posts/', postId
    And request { "id": #(postId), "title": "Automatizacion karate", "body": "Actualización con Karate", "userId": 1 }
    When method PUT
    Then status 200
    And match response.id == postId
    And match response.title == 'Automatizacion karate'
    And match response.body == 'Actualización con Karate'


  @Eliminar
  Scenario: 3. Eliminar una publicación (DELETE)
    Given path '/posts/', postId
    When method DELETE
    Then status 200


  @Mostrar
  Scenario: 4. Validar que la publicación fue eliminada (GET)
    Given path '/posts/', postId
    When method GET
    Then status 404