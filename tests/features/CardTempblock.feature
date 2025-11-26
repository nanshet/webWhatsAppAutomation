Feature: Card temp Block

  
  Scenario: Block the card temporarily
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Card Management" options
    And I click on dynamic Menu options in Meta
    And I click on "Card Temp Block" options
    And I click on "Card Temp Block" dynamic Menu options
    And I click on "DebitCard Ending 2949" options
    Then Bot should respond with "Please"
    Then Bot should respond with "Yes or No"
    And I send message "Yes"
    Then Bot should respond with "block your"
    Then Bot should respond with "Temporarily blocked"


    
    


Scenario: Temp Block using AI

    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "Block my cardvv"
    Then Bot should respond with "temporarily"
    And I send message "Temporary"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    You have one active Loan.
    Loan number:
    Loan Type:
    Total outstanding amount:
    Next installment amount:
    Next installment date:
    Total finance tenure (in months):
    """
    And I send message "yes"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total loan tenure (in months):
    """
    And I send message "when is the next due for my autoloan"
    Then Bot should respond with "next due"
    And I send message "how much amount was disbursed for personal loan"
    Then Bot should respond with "Loan disbursement amount"
    And I send message "Detils of my closed loan"
    Then Bot should respond with "No Closed loan"






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