Feature: GET Characters - user: btorresb

  Background:
    * configure ssl = true
    * def path = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'btorresb'
    * def endpoint = '/' + username + '/api/characters'
    * def fullUrl = path + endpoint

  Scenario: consult characters - GET /api/characters
    Given url fullUrl
    When method get
    Then status 200
    And match response == '#array'
    And print 'number of characters found: ', response.length
    And print 'Response:', response
    And print 'GET successful for user: ', username