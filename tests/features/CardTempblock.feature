Feature: Card temp Block

  
  Scenario: Block the card temporarily
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "Card Management" options
     And I click on Menu options in Meta
    And I click on "Card Temp Block" options
    And I click on Menu options in Meta
  




Scenario: Block the card temporarily
    Given I open Whats Web
   
    When I send message 0 from module "cardTempblock"
    Then Bot should respond with "Card Number"
    When I send message 1 from module "cardTempblock"
    Then Bot should respond with "Card Type"
    When I send message 2 from module "cardTempblock"
    Then Bot should respond with "Card Type: VISA GOLD"
    When I send message 3 from module "cardTempblock"
    Then Bot should respond with "Card Number"
     When I send message 4 from module "cardTempblock"
    Then Bot should respond with "Card Number"
    When I send message 5 from module "cardTempblock"
    Then Bot should respond with "Card Type"
    When I send message 6 from module "cardTempblock"
    Then Bot should respond with "Card Type: VISA GOLD"
    When I send message 7 from module "cardTempblock"
    Then Bot should respond with "Card Number"