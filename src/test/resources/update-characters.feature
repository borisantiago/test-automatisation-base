Feature: PUT Character - user: btorresb

Background:
  * configure ssl = true
  * def path = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  * def username = 'btorresb'
  * def endpoint = '/' + username + '/api/characters'
  * def fullUrl = path + endpoint

Scenario: update character and validate response - PUT /api/characters/3
  * def characterId = 3
  * def putUrl = fullUrl + '/' + characterId

  Given url putUrl
  And header Content-Type = 'application/json'
  And request
    """
    {
      "name": "Iron Man",
      "alterego": "Tony Stark",
      "description": "new generation gt",
      "powers": ["Armor", "Flight"]
    }
    """
  When method put
  Then status 200
  And match response.name == "Iron Man"
  And match response.alterego == "Tony Stark"
  And match response.description == "new generation gt"
  And match response.powers contains "Armor"
  And match response.powers contains "Flight"
  And print 'Character updated and validated for user:', username
  And print 'Response:', response