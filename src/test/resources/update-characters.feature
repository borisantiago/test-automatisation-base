Feature: PUT Character - user: btorresb

Background:
  * configure ssl = true
  * def path = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  * def username = 'btorresb'
  * def endpoint = '/' + username + '/api/characters'
  * def fullUrl = path + endpoint

Scenario: update first character and validate response
  # Obtener el primer personaje
  Given url fullUrl
  When method get
  Then status 200
  * def characterList = response
  * def characterId = characterList[0].id
  * def putUrl = fullUrl + '/' + characterId
  * print 'Character ID to update:', characterId

  # Hacer el update (PUT)
  Given url putUrl
  And header Content-Type = 'application/json'
  And request
    """
    {
      "name": "Iron Man update",
      "alterego": "Tony Stark",
      "description": "new generation update",
      "powers": ["Armor", "Flight"]
    }
    """
  When method put
  Then status 200
  And match response.name == "Iron Man update"
  And match response.alterego == "Tony Stark"
  And match response.description == "new generation update"
  And match response.powers contains "Armor"
  And match response.powers contains "Flight"
  And print 'Character updated and validated for user:', username
  And print 'Response:', response