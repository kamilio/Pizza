Feature: Order a pizza
  In order to not starve to death
  As a Pizzeria customer
  I want to order a Pizza

Background: Items have been added to DB
  Given the following items exist
  | name             | description   | price |
  | Pizza Margherita | Awesome Pizza | 5.5   |
  | Pasta Carbonara  | Awesome Pasta | 4.6   |
  
  And I am a logged user
  And I am on the home page
  
Scenario: Customer orders empty order
  When I press "Order now!"
  Then I should see error notice
