Feature: DELETE First Character by ID - user: btorresb

Background:
  * configure ssl = true
  * def path = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  * def username = 'btorresb'
  * def endpoint = '/' + username + '/api/characters'
  * def fullUrl = path + endpoint

Scenario: get first character and delete
  Given url fullUrl
  When method get
  Then status 200

  * def characterList = response
  * def characterId = characterList[0].id
  * def deleteUrl = fullUrl + '/' + characterId
  * print 'ID to delete:', characterId

  Given url deleteUrl
  When method delete
  Then status 204
  And print 'Deleted character ID:', characterId

  # Verificar que fue eliminado
  Given url deleteUrl
  When method get
  Then status 404
  And print 'Verified deletion of character ID:', characterId