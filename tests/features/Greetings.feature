Feature: Greetings 

 
  Scenario: Customer with greetings message
    Given I open Whats Web
    Then I search for the "New ENBD"
    And I selected the contact "New ENBD Assistant"
    When I send message 0 from module "greetings"

