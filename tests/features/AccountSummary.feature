Feature: Account Summary 

  
  Scenario: Account Summary for Menu
    Given I open Whats Web
    Then I search for the "New ENBD"
    And I selected the contact "New ENBD Assistant"
    And I send "Menu"
    And I click on Menu options
    And I click on "Accounts Services" options
    And I click on subMenu options
    And I click on "Account Summary" options
    And I click on accounts subMenu options
    And I select an account "0999503339701"
    And Response contains the summary details of account which has "LIVIONAIRE CURRENT ACCOUNT"
    Then I click on "Previous Menu" 
    And I capture a screenshot of the page


Scenario: Account Summary for AI

    Given I open Whats Web
    Then I search for the "New ENBD"
    And I selected the contact "New ENBD Assistant"
    When I send message 0 from module "Accounts"
    Then Bot should respond with "You have the following active accounts"
    When I send message 1 from module "Accounts"
    Then Bot should respond with " Account Number"
    When I send message 2 from module "Accounts"
    Then Bot should respond with "SWIFT"
    When I send message 3 from module "Accounts"
    Then Bot should respond with "IBAN: AE"
     When I send message 4 from module "Accounts"
    Then Bot should respond with "Summary"
     When I send message 5 from module "Accounts"
    Then Bot should respond with "Branch"


Scenario: Account Summary for AI

    Given I open Whats Web
    Then I search for the "New ENBD"
    And I selected the contact "New ENBD Assistant"
    When I send message 0 from module "Accounts"
    Then Bot should respond with "You have the following active accounts"
    When I send message 1 from module "Accounts"
    Then Bot should respond with " Account Number"
    When I send message 2 from module "Accounts"
    Then Bot should respond with "SWIFT"
    When I send message 3 from module "Accounts"
    Then Bot should respond with "IBAN: AE"
    When I send message 4 from module "Accounts"
    Then Bot should respond with "Summary"
    When I send message 5 from module "Accounts"
    Then Bot should respond with "Branch"




    Scenario: Account Summary  AI for Meta flow
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    When I send message 0 from module "Accounts"
    Then Bot should respond with "You have the following active accounts"
    When I send message 1 from module "Accounts"
    Then Bot should respond with " Account Number"
    When I send message 2 from module "Accounts"
    Then Bot should respond with "SWIFT"
    When I send message 3 from module "Accounts"
    Then Bot should respond with "IBAN: AE"
    When I send message 4 from module "Accounts"
    Then Bot should respond with "Summary"
    When I send message 5 from module "Accounts"
    Then Bot should respond with "Branch"



  Scenario: Account Summary for Meta in AI flow which has less than 3 accounts

    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    When I send message 0 from module "Accounts"
    Then Bot should respond with "menu"
    When I send message 1 from module "Accounts"
    Then Bot should respond with "You have the following active accounts"
    When I send message 2 from module "Accounts"
    Then Bot should respond with " Account Number"
    When I send message 3 from module "Accounts"
    Then Bot should respond with "SWIFT"
    When I send message 4 from module "Accounts"
    Then Bot should respond with "IBAN: AE"
    When I send message 5 from module "Accounts"
    Then Bot should respond with "Summary"
    When I send message 6 from module "Accounts"
    Then Bot should respond with "Branch"





     
   Scenario: Account Summary for Meta in AI flow which has more than 3 accounts

    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    When I send message 0 from module "Accounts"
    Then Bot should respond with "menu"
    When I send message 1 from module "Accounts"
    Then Bot should respond with "You have the following active accounts"
    When I send message 2 from module "Accounts"
    Then Bot should respond with " Account Number"
    When I send message 3 from module "Accounts"
    Then Bot should respond with "SWIFT"
    When I send message 4 from module "Accounts"
    Then Bot should respond with "IBAN: AE"
    When I send message 5 from module "Accounts"
    Then Bot should respond with "Summary"
    When I send message 6 from module "Accounts"
    Then Bot should respond with "Branch"



    Scenario: Account Summary for Menu in Metaflow
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
    And Response contains the  details of account which has "CURRENT ACCOUNT"
    Then I click on "Check Other Accounts" in Meta
    And I click on Menu options in Meta
    And I select an account "1015873067205" in Meta
    And Response contains the summary details of account which has "CURRENT ACCOUNT"
    Then I click on "Previous Menu" 