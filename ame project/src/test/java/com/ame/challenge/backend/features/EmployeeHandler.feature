@IGNORE
Feature: Employee Handler
  This feature contains some scenarios to handle a employee

  Background:
    * url BACKEND_URL

  @CREATE
  Scenario: Create a employee
    * def employeeRequest = read('classpath:com/ame/challenge/backend/requests/employee.json')
    * set employeeRequest.name = name
    * set employeeRequest.salary = salary
    * set employeeRequest.age = age
    Given path '/create'
    And header karate-name = 'Create Employee'
    And request employeeRequest
    When method POST
    Then status 200
    And match response.status ==  "success"

  @READ
  Scenario: read employee
    Given path '/employee/' + employeeId
    And header karate-name = 'Read employee'
    When method GET
    Then status 200
    And match response.status ==  "success"

  @DELETE
  Scenario: Delete employee
    Given path '/delete/' + employeeId
    And header karate-name = 'Delete employee'
    When method DELETE
    Then status 200
    And match response.status ==  "success"