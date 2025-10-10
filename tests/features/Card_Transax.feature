Feature: Card Transactions 


  Scenario: Card Transactions  for AI
    Given I open Whats Web
    
    When I send message 0 from module "cardTransactions"
    Then Bot should respond with "menu"
    When I send message 1 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 2 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 3 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 4 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 5 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 6 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 7 from module "cardTransactions"
    Then Bot should respond with "Transactions"
    When I send message 8 from module "cardTransactions"
    Then Bot should respond with "Transactions"

   



  @MenuRunner
  Scenario: Card Transactions for Menu
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "Other Card Services" options
    And I click on Menu options in Meta
    And I click on "Card Transactions" options
    And I wait for accounts list to appear
    And I click on Menu options in Meta
    And I select an account "0215873067209" in Meta
    And Response contains the  details of account which has "Card Transactions"
    Then I click on "Check Other Accounts" in Meta
    And I click on Menu options in Meta
    And I select an account "1015873067205" in Meta
    And Response contains the  details of account which has "Card Transactions"
    Then I click on "Previous Menu" in Meta
    When I send message 0 from module "Accountsbalance"


