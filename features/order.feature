Feature: Order a pizza
  In order to not starve to death
  As a Pizzeria customer
  I want to order a Pizza

Background: Items have been added to DB
  Given the following items exist
  | name             | description   | price |
  | Pizza Margherita | Awesome Pizza | 5.5   |
  | Pasta Carbonara  | Awesome Pasta | 4.6   |
  
  Given I log in
  
Scenario: Customer orders empty order
  When I press "Order now!"
  Then I should see "Please, order something!"
  
Scenario: I create a Pizza order
  When I press "+"
  And I press "Order now!"
  Then I should see "Order summary"

Scenario: I order a Pizzas
  When I press "+"
  And I press "Order now!"
  And I press "Order!"
  Then I should see "Succesfully ordered"
  
