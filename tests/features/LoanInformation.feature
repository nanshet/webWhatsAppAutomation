
Feature: Loans Information

  
  Scenario: Customer with no Loans[EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I just send message "List my loans"
    Then the "Loans" module response should match intent "No active loans or No loans"

    
  Scenario: Customer with one Loans[EIB]
    Given I open Whats Web
    Then I search for the "New ENBD"
    And I selected the contact "New ENBD Assistant"
    When I send message 0 from module "Loans"
    Then Bot should respond with "Finance Type"
    When I send message 4 from module "Loans"
    Then Bot should respond with "Next Installment Date"
    When I send message 2 from module "Loans"
    Then Bot should respond with "Profit Rate"
    When I send message 5 from module "Loans"
    Then Bot should respond with "Next Installment Date"
    When I send message 6 from module "Loans"
    Then Bot should respond with "Next Installment Date"
    


  Scenario: Customer Loan with Meta in AI Flow
    Given I open Whats Web
    # Then I search for the "Meta Number"
    # And I selected the contact "Meta Number"
    When I send message 0 from module "Loans"
    Then Bot should respond with "Finance Type"
    When I send message 1 from module "Loans"
    Then Bot should respond with "Finance Type"
    When I send message 4 from module "Loans"
    Then Bot should respond with "Next Installment Date"
    When I send message 2 from module "Loans"
    Then Bot should respond with "Profit Rate"
    When I send message 5 from module "Loans"
    Then Bot should respond with "Next Installment Date"
    When I send message 6 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 1 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 3 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 7 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 8 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 9 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 10 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 11 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 12 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 13 from module "Loans"
    Then Bot should respond with "Next Installment Date"
     When I send message 14 from module "Loans"
    Then Bot should respond with "Next Installment Date"


#################################################################################



  Scenario: Customer with 1 Loan with Meta in AI Flow[EIB]

    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "Loan info"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    You have one active finance.
    Finance number:
    Finance Type:
    Total outstanding amount:
    Next installment amount:
    Next installment date:
    Total finance tenure (in months):
    """
    And I send message "Yes I need more details"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Finance number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Finance paid till date
    Total finance tenure (in months):
    """
    And I send message "when is my next due for my loan"
    Then Bot should respond with "next due"



  
   Scenario: Loan Info for Menu in Metaflow with one active account[EIB]

    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on dynamic Menu options in Meta
    And I click on "Finance Information" options in Meta
    Then Bot should respond
    """
    Finance number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Finance paid till date
    Total finance tenure (in months):
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"



   Scenario: Customer with more than 3 Loan with Meta in AI Flow[EIB]
  
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "List my finances"
     Then Bot should respond with "Please" 
    Then Bot should respond
    """
    You have multiple finances.
    Finance Type:
    Finance Number:
    """
    And I send message "3,4"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Finance number
    Finance Type
    Total outstanding amount:
    Next installment amount:
    Next installment date:
    Total finance tenure (in months):
    """
    And I send message "Interest rate for my vehicle murabha"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Finance number:
    Profit rate:
    """
    And I send message "How much amoutn I have paid till now for my MANZILI-MUSHARAKAH IJARA"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Finance number:
    Total amount paid:
    """

    And I send message "when is the next due of my vehicle murabaha"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Finance number:
    Next installment date:
    """
    And I send message "loan ending with 80001"
    Then Bot should respond with "Please"
  #   Then Bot should respond
  #   """
  #   Finance number:
  #   Finance Type:
  #   Total outstanding amount:
  #   Next installment amount:
  #   Next installment date:
  #   Total finance tenure(in months):
  #   """
  #   And I send message "Yes i need more"
  #  Then Bot should respond with "Please"
    Then Bot should respond
    """
    Finance number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Finance paid till date
    Total finance tenure (in months):
    """



  Scenario: Loan Info for Menu in Metaflow with multiple active account[EIB]

    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on dynamic Menu options in Meta
    And I click on "Finance Information" options in Meta
    And I click on dynamic Menu options in Meta
    And I select an account "7102074848330001" in Meta
    Then Bot should respond
    """
    Finance number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Finance paid till date
    Total finance tenure (in months):
    """
    And I click on "View other finances" in Meta
    And I click on dynamic Menu options in Meta
    And I select an account "7239775092980001" in Meta
    Then Bot should respond
    """
    Finance Account number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Finance paid till date
    Total finance tenure (in months):
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"


    Scenario: Customer with no loan Meta in AI Flow[EIB]
  
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "List my finances"
    Then Bot should respond with "you don’t have any active finances"
    


    Scenario: Customer with closed loan Meta in AI Flow[EIB]
  
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "can you please which loans are closed"
    Then Bot should respond with " no closed finances"
    

    
    Scenario: Customer with 1 Loan with Meta in AI Flow[EBI]

    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "list my loans"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    You have one active finance.
    Loan number:
    Loan Type:
    Total outstanding amount:
    Next installment amount:
    Next installment date:
    Total loan tenure (in months):
    """
    And I send message "Yes I need more details"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure (in months):
    """
    And I send message "when is the next due for my autoloan"
    Then Bot should respond with "next due"
    And I send message "how much amount was disbursed for personal loan"
    Then Bot should respond with "Finance disbursement amount"



 
   Scenario: Loan Info for Menu in Metaflow with one active account[EBI]

    Given I open Whats Web
    # Then I search for the "Meta ENBD New"
    # And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "More Services" options
    And I click on Menu options in Meta
    And I click on "Loan Information" options in Meta
    Then Bot should respond
    """
    Finance number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Profit Rate:
    Next installment date:
    Final installment date:
    Finance paid till date
    Total finance tenure (in months):
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"




Scenario: Loan Info for Menu in Meta flow with multiple active account[EBI]

    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message in Arabic "القائمة"
    And I click on Menu options for arabic in Meta
    And I click on "المزيد من الخدمات" options
    And I click on subMenu options for arabic in Meta
    And I click on "تفاصيل القروض" options in Meta
    And I wait for loans list in arabic and select the loan from the list
    And I select an account "7001494089800001" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure (in months):
    """
    And I click on "عرض القروض الأخرى" in Meta
    And I wait for loans list in arabic and select the loan from the list
    And I select an account "8132232760530009" in Meta
    Then Bot should respond
    """
    Loan Account number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure (in months):
    """
    And I click on "القائمة الرئيسية" in Meta
    Then Bot should respond with "الرجاء اختيار الخدمة من القائمة أدناه"





Scenario: Customer with more than 3 Loan with Meta in AI Flow[EBI]
  
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "List my loans"
    Then Bot should respond with "Please" 
    Then Bot should respond
    """
    You have following active loans.
    Loan Type:
    Loan Number:
    """
    And I send message "3,4"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Here are the details for  
    Loan Number:  
    Total outstanding amount:  
    Next installment amount:  
    Next installment date:  
    Total loan tenure (in months):  
    """
    And I send message "Interest rate of my autoloan"
    Then Bot should respond with "Please"
    Then Bot should respond with "interest rate"
    And I send message "How much amoutn I have paid till now for my personal loan"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number:
    Total amount paid:
    """
    And I send message "when is the next due for my loans"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number:
    Next installment date:
    """
    And I send message "loan ending with 30009"
    Then Bot should respond with "Please"
  #   Then Bot should respond
  #   """
  #   Finance number:
  #   Finance Type:
  #   Total outstanding amount:
  #   Next installment amount:
  #   Next installment date:
  #   Total finance tenure(in months):
  #   """
  #   And I send message "Yes i need more"
  #  Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number:  
    Total outstanding amount:  
    Total loan tenure (in months): 
    Next installment amount: 
    Next installment date: 
    """



Scenario: Loan Info for Menu in Metaflow with multiple active loan[EBI]

    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on dynamic Menu options in Meta
    And I click on "Loan Information" options in Meta
    And I click on dynamic Menu options in Meta
    And I select an account "7001494089800001" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure:
    """
    And I click on "View other loans" in Meta
    And I click on dynamic Menu options in Meta
    And I select an account "8132232760530009" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure:
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"


Scenario: Customer with more than 3 Loan with Meta in AI Flow[LIV]
  
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "List my loans"
    Then Bot should respond with "Please" 
    Then Bot should respond
    """
    You have following active loans.
    Loan Type:
    Loan Number:
    """
    And I send message "3,4"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Here are the details for  
    Loan Number:  
    Total outstanding amount:  
    Next installment amount:  
    Next installment date:  
    Total loan tenure (in months):  
    """
    And I send message "Interest rate of my autoloan"
    Then Bot should respond with "Please"
    Then Bot should respond with "interest rate"
    And I send message "How much amoutn I have paid till now for my personal loan"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number:
    Total amount paid:
    """
    And I send message "when is the next due for my loans"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number:
    Next installment date:
    """
    And I send message "loan ending with 30009"
    Then Bot should respond with "Please"
  #   Then Bot should respond
  #   """
  #   Finance number:
  #   Finance Type:
  #   Total outstanding amount:
  #   Next installment amount:
  #   Next installment date:
  #   Total finance tenure(in months):
  #   """
  #   And I send message "Yes i need more"
  #  Then Bot should respond with "Please"
    Then Bot should respond
    """
    Loan number:  
    Total outstanding amount:  
    Total loan tenure (in months): 
    Next installment amount: 
    Next installment date: 
    """


Scenario: Loan Info for Menu in Metaflow with multiple active loan[LIV]

    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on dynamic Menu options in Meta
    And I click on "Loan Information" options in Meta
    And I click on dynamic Menu options in Meta
    And I select an account "5172950004911757" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure:
    """
    And I click on "View other loans" in Meta
    And I click on dynamic Menu options in Meta
    And I select an account "5172950004911701" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure:
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"




Scenario: Loan Info for Menu in Meta flow with multiple active account[LIV]

    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message in Arabic "القائمة"
    And I click on Menu options for arabic in Meta
    And I click on "المزيد من الخدمات" options
    And I click on subMenu options for arabic in Meta
    And I click on "معلومات القرض" options in Meta
    And I wait for loans list in arabic and select the loan from the list
    And I select an account "5172950004911757" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure (in months):
    """
    And I click on "عرض القروض الأخرى" in Meta
    And I wait for loans list in arabic and select the loan from the list
    And I select an account "5172950004911701" in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure (in months):
    """
    And I click on "القائمة الرئيسية" in Meta
    Then Bot should respond with "الرجاء اختيار الخدمة من القائمة أدناه"


Scenario: Customer with 1 Loan with Meta in AI Flow[LIV]

    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "list my loans"
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



 
   Scenario: Loan Info for Menu in Metaflow with one active account[LIV]

    Given I open Whats Web
    # Then I search for the "Meta ENBD New"
    # And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on Menu options in Meta
    And I click on "Loan Information" options in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Finance disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total finance tenure (in months):
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"

  
  Scenario: Loan Info for Menu in Meta flow with one active account[LIV] in Arabic

    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send "القائمة"
    And I click on Menu options for arabic in Meta
    And I click on "المزيد من الخدمات" options
    And I click on subMenu options for arabic in Meta
    And I click on "تفاصيل القروض" options in Meta
    Then Bot should respond
    """
    Loan number
    Total outstanding amount:
    Next installment amount:
    Loan disbursement amount:
    Interest Rate:
    Next installment date:
    Final installment date:
    Loan paid till date
    Total Loan tenure (in months):
    """
    And I click on "القائمة الرئيسية" in Meta
    Then Bot should respond with "الرجاء اختيار الخدمة من القائمة أدناه"


    Scenario: Customer with no loan Meta in AI Flow[EBI]
  
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "List my loans"
    Then Bot should respond with "Please"
    Then Bot should respond with "you don’t have any active loans"



    Scenario: Customer with closed loan Meta in AI Flow[EBI]
  
    Given I open Whats Web
   Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "can you please which loans are closed"
    Then Bot should respond with "Please"
    Then Bot should respond with " no closed loans"