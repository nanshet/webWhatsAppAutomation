Feature: Account Balance 


  Scenario: Account balance for AI
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    When I send message 0 from module "Loans"
    When I send message 0 from module "Accountsbalance"
    Then Bot should respond with "Account Number"
    When I send message 1 from module "Accountsbalance"
    Then Bot should respond with "Account Balance"
    When I send message 2 from module "Accountsbalance"
    Then Bot should respond with "Chat with agent"
   


  Scenario: Service Request for Menu and AI in Meta with One SR
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "More Services" options
    And I click on Menu options in Meta
    And I click on "Track Requests" options
    #And I wait for service request list to appear
    # And I click on Menu options in Meta
    # And I select an account "22883534163" in Meta
    And Response contains the  details of account which has "SR Number"
    And I send message 0 from module "servicerequests"
    Then Bot should respond with "Next Installment Date"
    And I send message 2 from module "servicerequests"
    Then Bot should respond with "Next Installment Date"
    And I send message 1 from module "servicerequests"
    Then Bot should respond with "Next Installment Date"




    @loans
  Scenario: Service Request for Menu and AI in Meta with multiple SR
    Given I open Whats Web
    Then I search for the "Meta Number"
    And I selected the contact "Meta Number"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "More Services" options
    And I click on Menu options in Meta
    And I click on "Track Requests" options
    And I wait for service request list to appear
    And I click on Menu options in Meta
    And I select an account "22801455903" in Meta
    And Response contains the  details of account which has "SR Number"
    And I send message 0 from module "servicerequests"
    Then Bot should respond with "Next Installment Date"
    And I send message 2 from module "servicerequests"
    Then Bot should respond with "Loan on card"
    And I send message 1 from module "servicerequests"
    Then Bot should respond with "SR Number"


