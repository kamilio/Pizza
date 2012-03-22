Feature: Order a pizza
  In order to not starve to death
  As a Pizzeria customer
  I want to order a Pizza

Background: Items have been added to DB
  Given the following items exist
  | name             | description   | price |
  | Pizza Margherita | Awesome Pizza | 5.5   |
  | Pasta Carbonara  | Awesome Pasta | 4.6   |
  
  Given I am the registered user
  And I am on login page
  When I login with valid credentials
  Then I should be on the home page
  And I should see "Login successful!"
  
Scenario: Customer orders empty order
  When I press "Order now!"
  Then I should see "Please, order something!"
