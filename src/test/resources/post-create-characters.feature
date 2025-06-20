Feature: POST Characters - user: btorresb

  Background:
    * configure ssl = true
    * def path = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
    * def username = 'btorresb'
    * def endpoint = '/' + username + '/api/characters'
    * def fullUrl = path + endpoint

  Scenario: create character - POST /api/characters
    Given url fullUrl
    And header Content-Type = 'application/json'
    And request
      """
      {
        "name": "Captain America 2",
        "alterego": "Steve Rogers",
        "description": "Genius billionaire",
        "powers": ["Armor", "Flight"]
      }
      """
    When method post
    Then status 201
    And print 'Character created successfully for user:', username
    And print 'Response:', response