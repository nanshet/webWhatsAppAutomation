Feature: Send WhatsApp Message

  
  Scenario: Send a message to a contact
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