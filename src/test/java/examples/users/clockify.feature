Feature: Clockify Academy 2022

  Background: URL y Headers


  Scenario Outline: Consultar proyecto por id
    Given url urlBase
    And path 'workspaces/<workspaceId>/projects/<projectId>'
    And header X-Api-Key = 'ZDg1ZGMxNzAtYzEwZi00Y2QyLTgzMzUtMjU5MzNmYmIxZGY1'
    And header Content-type = 'application/json'
    When method GET
    Then status 200
    And match response.name == '<projectName>'

    Examples:
      | workspaceId              | projectId                | projectName |
      | 633f5b7689bf9c24493ee39d | 633f68a76480480640550da7 | Giuliana2   |

@proyecto
  Scenario Outline: Eliminar Time Entry
    * def responseId = call read('classpath:examples/users/createTimeEntry.feature')
    * def idTimeEntry = responseId.id
    Given url urlBase
    And path 'workspaces/<workspaceId>/time-entries', idTimeEntry
    And header X-Api-Key = 'ZDg1ZGMxNzAtYzEwZi00Y2QyLTgzMzUtMjU5MzNmYmIxZGY1'
    And header Content-type = 'application/json'
    When method DELETE
    Then status 204

    Examples:
      | workspaceId              |
      | 633f5b7689bf9c24493ee39d |