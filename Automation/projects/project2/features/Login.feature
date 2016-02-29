
Feature: User go to login page from home page and try to login

  Scenario Outline: User go to login page from home page
    Given User go to amazon page
    When User click Your Amazon.com button
    Then Current page must be <page_name> page

  Examples:
    |page_name|
    |sign_in_page|



