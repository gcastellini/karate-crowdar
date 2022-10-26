Feature: Creacion Time Entries

  Scenario Outline: Agregar Time Entry
    * def body = read('classpath:examples/users/request/addTime.json')
    Given url urlBase
    And path 'workspaces/<workspaceId>/time-entries'
    And header X-Api-Key = 'ZDg1ZGMxNzAtYzEwZi00Y2QyLTgzMzUtMjU5MzNmYmIxZGY1'
    And header Content-type = 'application/json'
    And request body
    When method POST
    * def sleep =
  """
  function(){
  java.lang.Thread.sleep(5000);
  }
  """
    * call sleep
    Then status 201
    * def id = response.id
    Examples:
      | workspaceId              |
      | 633f5b7689bf9c24493ee39d |