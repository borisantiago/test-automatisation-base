Feature: DELETE Character - user: btorresb

Background:
  * configure ssl = true
  * def path = 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  * def username = 'btorresb'
  * def endpoint = '/' + username + '/api/characters'
  * def fullUrl = path + endpoint

Scenario: delete character - DELETE /api/characters/x
  * def characterId = 7
  * def deleteUrl = fullUrl + '/' + characterId

  Given url deleteUrl
  When method delete
  Then status 204
  And print 'Character deleted successfully for user:', username

Scenario: verify character is deleted - GET /api/characters/7
  * def characterId = 7
  * def getUrl = fullUrl + '/' + characterId

  Given url getUrl
  When method get
  Then status 404
  And print 'Verified character deletion for ID:', characterId