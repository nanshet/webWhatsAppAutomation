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


#################################

  
    Scenario: Account Summary AI for Meta flow with 1 account[EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "Summary of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Fetching"
    Then Bot should respond
    """
    You have one active account.
    Account Name:
    Account Number:
    Currency:
    """
    And I send message "yes I need more info for my savings account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "IBAN for my savings account"
    Then Bot should respond with "Please"
    Then Bot should respond with "IBAN"
    And I send message "I need to know summary of my freind's account"
    Then Bot should respond with "cannot access or summarize"
    And I send message "Branch details of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Branch Name"





  Scenario: Account Summary for Menu in Metaflow in [EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Previous Menu" in Meta
    Then Bot should respond with "Explore"


Scenario: Account Summary for Menu in Arabic in [EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send "القائمة"
    And I click on Menu options for arabic in Meta
    And I click on "خدمات الحساب" options
    And I click on subMenu options for arabic in Meta
    And I click on "ملخص الحساب" options
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "القائمة السابقة" in Meta
    Then Bot should respond with "خدمات الحساب"





Scenario: Account Summary AI for Meta flow with more than 3 account[EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "Summary of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Fetching"
    Then Bot should respond
    """
    You have active account.
    Account Name:
    Account Number:
    Currency:
    """
    And I send message "2,3"
     Then Bot should respond with "Please"
    Then Bot should respond with "Fetching"
    Then Bot should respond
    """
    You have active account.
    Account Name:
    Account Number:
    """
    And I send message "yes I need more info for my current account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    Currency
    """
    And I send message "IBAN for my savings account"
    Then Bot should respond with "Please"
    Then Bot should respond with "IBAN"
    And I send message "Swiftcode"
    Then Bot should respond with "Please"
    Then Bot should respond with "Swiftcode"
    And I send message "I need to know summary of my freind's account"
    Then Bot should respond with "cannot access or summarize"
    And I send message "Branch address of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Branch Name"



Scenario: Account Summary for Menu in Metaflow in [EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    And I click on accounts subMenu options
    And I select an account "3637630038204" in Meta
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Choose Other Account" in Meta
    Then Bot should respond with "Fetching"
    And I click on accounts subMenu options
    And I select an account "0947630038205" in Meta
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Previous Menu" in Meta
    Then Bot should respond with "Explore"


     

  Scenario: Customer with closed accounts Meta in AI Flow[EIB]
  
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "give me details on my clsed acct"
    Then Bot should respond with "Please"
    Then Bot should respond with " no closed accounts"



  Scenario: Customer with no accounts Meta in AI Flow[EIB]
  
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "details of my account"
    Then Bot should respond with "Fetching"
     Then Bot should respond with "Please"
    Then Bot should respond with "no active accounts"




  Scenario: Customer with Livionaire account [LIV]
  
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "details of my account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "summary of my livionaire account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "summary of my gold account"
    Then Bot should respond with "Please"
    Then Bot should respond with "no gold accounts"
   


Scenario: Account Summary for Menu in Metaflow in [LIV]
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Previous Menu" in Meta
    Then Bot should respond with "Explore"



Scenario: Customer with Gold account [LIV]
  
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "details of my account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Currency
    """
    And I send message "summary of my gold account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "summary of my livionaire account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "summary of my goal account"
    Then Bot should respond with "Please"
    Then Bot should respond with "no accounts"
  



Scenario: Customer with Goal account [LIV]
  
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "details of my account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Currency
    """
    And I send message "summary of my goal account ending with 400009"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "swiftcode"
    Then Bot should respond with "Please"
    Then Bot should respond with "swiftcode"
 

  Scenario: Account Summary for Menu in Metaflow in [LIV]
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    And I click on accounts subMenu options
    And I select an account "0999503368101" in Meta
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Choose Other Account" in Meta
    Then Bot should respond with "Fetching"
    And I click on accounts subMenu options
    And I select an account "3989503368102" in Meta
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Previous Menu" in Meta
    Then Bot should respond with "Explore"



Scenario: Account Summary AI for Meta flow with more than 3 account[EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "Summary of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Fetching"
    Then Bot should respond
    """
    You have active account.
    Account Name:
    Account Number:
    Currency:
    """
    And I send message "2,3"
     Then Bot should respond with "Please"
    Then Bot should respond with "Fetching"
    Then Bot should respond
    """
    You have active account.
    Account Name:
    Account Number:
    """
    And I send message "yes I need more info for my current account"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    Currency
    """
    And I send message "IBAN for my savings account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Hold on"
    And I send message "4,5"
    Then Bot should respond with "Please"
    Then Bot should respond with "IBAN"
    And I send message "Swiftcode"
    Then Bot should respond with "Please"
    Then Bot should respond with "Swiftcode"
    And I send message "I need to know summary of my freind's account"
    Then Bot should respond with "cannot access or summarize"
    And I send message "Branch address of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Branch Name"
    And I send message "I need to know summary of my gold account"
    Then Bot should respond with "Please"
    Then Bot should respond with "no gold account"


  
   Scenario: Account Summary for Menu more than 3 accounts in Metaflow in [EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    And I click on accounts subMenu options
    And I select an account "0212327605312" in Meta
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Choose Other Account" in Meta
    Then Bot should respond with "Fetching"
    And I click on accounts subMenu options
    And I select an account "1102327605301" in Meta
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Previous Menu" in Meta
    Then Bot should respond with "Explore" 

 
Scenario: Account Summary AI for Meta flow with 1 account[EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "Summary of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Fetching"
    Then Bot should respond
    """
    You have one active account.
    Account Name:
    Account Number:
    Currency:
    """
    And I send message "yes I need more info"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I send message "IBAN for my savings account"
    Then Bot should respond with "Please"
    Then Bot should respond with "IBAN"
    And I send message "I need to know summary of my freind's account"
    Then Bot should respond with "cannot access or summarize"
    And I send message "Branch details of my account"
    Then Bot should respond with "Please"
    Then Bot should respond with "Branch Name"




  Scenario: Account Summary for Menu in Metaflow in [EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "Previous Menu" in Meta
    Then Bot should respond with "Explore"


Scenario: Account Summary for Menu in Arabic in [EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send "القائمة"
    And I click on Menu options for arabic in Meta
    And I click on "خدمات الحساب" options
    And I click on subMenu options for arabic in Meta
    And I click on "ملخص الحساب" options
    Then Bot should respond
    """
    Account Name:
    Account Number:
    Account Holder Name:
    Swift Code:
    Routing Code:
    IBAN:
    Profit Rate
    Profit Frequency
    Bank Name & Address
    Your Bank Branch
    """
    And I click on "القائمة السابقة" in Meta
    Then Bot should respond with "خدمات الحساب"







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
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send "Menu"
    And I click on Menu options in Meta
    And I click on "Accounts Services" options
    And I click on Menu options in Meta
    And I click on "Account Summary" options
    And I wait for accounts list to appear
    And I click on Menu options in Meta
    And I select an account "0215873067209" in Meta
    And Response contains the  details of account which has "CURRENT ACCOUNT"
    Then I click on "Check Other Accounts" in Meta
    And I click on Menu options in Meta
    And I select an account "1015873067205" in Meta
    And Response contains the summary details of account which has "CURRENT ACCOUNT"
    Then I click on "Previous Menu" 




   