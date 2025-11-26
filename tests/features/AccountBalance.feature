Feature: Account Balance 


  Scenario: Account balance for AI
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    When I send message 0 from module "Accountsbalance"
    Then Bot should respond with "menu"
    When I send message 1 from module "Accountsbalance"
    Then Bot should respond with "Account Number"
    When I send message 2 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 3 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 4 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 5 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 6 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 7 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 8 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"

   



  
  Scenario: Account balance for Menu
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Balance" options
    And I wait for accounts list to appear
    And I click on Menu options in Meta
    And I select an account "0215873067209" in Meta
    And Response contains the  details of account which has "Account Balance"
    Then I click on "Check Other Accounts" in Meta
    And I click on Menu options in Meta
    And I select an account "1015873067205" in Meta
    And Response contains the  details of account which has "Account Balance"
    Then I click on "Previous Menu" in Meta
    When I send message 0 from module "Accountsbalance"



@drop1
 Scenario: Send "Account Balance" message 100 times to verify bot response
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    When I send "Credit Card Balance" message 50 times and capture responses
    Then I should generate HTML report with screenshots
