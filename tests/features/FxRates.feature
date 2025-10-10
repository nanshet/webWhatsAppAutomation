Feature: FX Rates

    
    Scenario: FX rates for AI

    Given I open Whats Web
    Then I search for the "New ENBD"
    And I selected the contact "New ENBD Assistant"
    When I send message 0 from module "fxRates"
    Then Bot should respond with "I can share the latest rates"
    When I send message 1 from module "fxRates"
    Then Bot should respond with "POUNDS STERLING"
    When I send message 2 from module "fxRates"
    Then Bot should respond with "Conversion Rates"
    When I send message 3 from module "fxRates"
    Then Bot should respond with "Pounds"
     When I send message 4 from module "fxRates"
    Then Bot should respond with "Money Lenders"
     When I send message 5 from module "fxRates"
    Then Bot should respond with "INR, USD, GBP, EUR"



   
    Scenario: Fx Rates for AI for Meta [EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "get me my fxrates"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    All conversion rates are against 1 AED 
    You have one active finance.
    US Dollar (USD):
    Pounds Sterling (GBP): 
    Euro (EUR): 
    Indian Rupee (INR): 
    """
    And I send message "How much I will get in AED for 10 NZD"
    Then Bot should respond with "Please"
    Then Bot should respond with "NZD"
    And I send message "Transfer rates for London"
    Then Bot should respond with "do not have a service to transfer"
     And I send message "How much i will get for 2000 INR"
    Then Bot should respond with "Please"
    Then Bot should respond with "INR"




Scenario: Fx Rates for AI for Meta [EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "get me my fxrates"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    All conversion rates are against 1 AED 
    You have one active finance.
    US Dollar (USD):
    Pounds Sterling (GBP): 
    Euro (EUR): 
    Indian Rupee (INR): 
    """
    And I send message "How much I will get in AED for 10 NZD"
    Then Bot should respond with "Please"
    Then Bot should respond with "NZD"
    And I send message "Transfer rates for London"
    Then Bot should respond with "do not have a service to transfer"
     And I send message "How much i will get for 2000 INR"
    Then Bot should respond with "Please"
    Then Bot should respond with "INR"
    And I send message "How much I will get for 1000000 INR"
    Then Bot should respond with "Please"
    Then Bot should respond with "INR"




   Scenario: Fx Rates for Menu for Meta [EBI]
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on Menu options in Meta
    And I click on "FX Rates" options in Meta
    Then Bot should respond
    """
    Here are the Conversion Rates for various currencies
    US Dollar:
    Pounds Sterling: 
    Euro: 
    Indian Rupee:
    
    Note: The currency rates provided here show the sell rates. These rates are subject to change according to market fluctuations.
    """
   And I click on "More" in Meta
   Then Bot should respond
    """
    Here are the Conversion Rates for various currencies
    AUSTRALIAN DOLLAR:
    BAHRAINI DINAR: 
    CANADIAN DOLLAR
    CHINESE YUANOFFSHORE
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "explore"



    
   Scenario: Fx Rates for Menu for Meta in ARABIC [LIV]
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message in Arabic "القائمة"
    And I click on Menu options for arabic in Meta
    And I click on "معلومات و إعدادات " options
    And I click on subMenu options for arabic in Meta
    And I click on "أسعار صرف العملات" options in Meta
    Then Bot should respond
    """
    إليك أسعار التحويل لمختلف العملات :
    US Dollar:
    Pounds Sterling: 
    Euro: 
    Indian Rupee:
    
     أسعار العملات المعروضة هنا تُمثل أسعار البيع. هذه الأسعار قابلة للتغيير وفقًا لتقلبات السوق.
    """
   And I click on "المزيد" in Meta
   Then Bot should respond
    """
    إليك أسعار التحويل لمختلف العملات :
    AUSTRALIAN DOLLAR:
    BAHRAINI DINAR: 
    CANADIAN DOLLAR
    CHINESE YUANOFFSHORE
    
     أسعار العملات المعروضة هنا تُمثل أسعار البيع. هذه الأسعار قابلة للتغيير وفقًا لتقلبات السوق.
    """
    And I click on "القائمة الرئيسية" in Meta
    Then Bot should respond with "الرجاء اختيار الخدمة من القائمة أدناه"





    Scenario: Fx Rates for AI for Meta [LIV]
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "get me my fxrates"
    Then Bot should respond with "Please"
    Then Bot should respond
    """
    All conversion rates are against 1 AED 
    You have one active finance.
    US Dollar (USD):
    Pounds Sterling (GBP): 
    Euro (EUR): 
    Indian Rupee (INR): 
    """
    And I send message "How much I will get in AED for 10 NZD"
    Then Bot should respond with "Please"
    Then Bot should respond with "NZD"
    And I send message "Transfer rates for London"
    Then Bot should respond with "do not have a service to transfer"
    And I send message "How much i will get for 2000 INR"
    Then Bot should respond with "Please"
    Then Bot should respond with "INR"



Scenario: Fx Rates for Menu for Meta [LIV]
    Given I open Whats Web
    Then I search for the "Meta LIV"
    And I selected the contact "Meta LIV"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on Menu options in Meta
    And I click on "FX Rates" options in Meta
    Then Bot should respond
    """
    Here are the Conversion Rates for various currencies
    US Dollar:
    Pounds Sterling: 
    Euro: 
    Indian Rupee:
    
    Note: The currency rates provided here show the sell rates. These rates are subject to change according to market fluctuations.
    """
   And I click on "More" in Meta
   Then Bot should respond
    """
    Here are the Conversion Rates for various currencies
    AUSTRALIAN DOLLAR:
    BAHRAINI DINAR: 
    CANADIAN DOLLAR
    CHINESE YUANOFFSHORE
    """
    And I click on "Main Menu" in Meta
    Then Bot should respond with "Explore"
