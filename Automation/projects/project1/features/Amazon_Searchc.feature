@Smoke
Feature: Amazon search function

  Scenario Outline: User can search any items from amazon
    Given User go to amazon
    When User input items <query> to search
    Then User get <query> from result

  Examples:
    |query|
  Data:Search/searchitem.CSV

