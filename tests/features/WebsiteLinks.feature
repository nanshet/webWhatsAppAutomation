Feature: Website SS Links

  
  Scenario: Website links in Menu flow
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "KYC update" options
    Then Bot should respond with "https://www.emiratesnbd.com/kycr"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Standing Instruction" options
    Then Bot should respond with "https://www.emiratesnbd.com/cysi"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Card Billing Cycle" options
    Then Bot should respond with "https://www.emiratesnbd.com/cyccbc"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Defer Loan cycle" options
    Then Bot should respond with "https://www.emiratesnbd.com/dylp"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Convert to IPP" options
    Then Bot should respond with "https://www.emiratesnbd.com/ippr"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Convert to 0 percent IPP" options
    Then Bot should respond with "https://www.emiratesnbd.com/zpippr"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Balcon request" options
    Then Bot should respond with "https://www.emiratesnbd.com/ibcpr"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Cancel IPP" options
    Then Bot should respond with "https://www.emiratesnbd.com/ippcr"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "Cancel LOC" options
    Then Bot should respond with "https://www.emiratesnbd.com/loccr"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "Local remittance" options
    Then Bot should respond with "https://www.emiratesnbd.com/lorc"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "International remittance" options
    Then Bot should respond with "https://www.emiratesnbd.com/iorc"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "Info and Settings" options
    And I click on "Info and Settings" dynamic Menu options
    And I click on "Website Self-Services" options
    And I click on "Website Self-Service" dynamic Menu options
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "Inward remittance" options
    Then Bot should respond with "https://www.emiratesnbd.com/irr"
    

    


Scenario: Website links in AI flow
    Given I open Whats Web
    Then I search for the "Meta ENBD New"
    And I selected the contact "Meta ENBD New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "I need to update to emirates ID"
    Then Bot should respond with "https://www.emiratesnbd.com/kycr"
    And I send message "I need to cancel standing instruction"
    Then Bot should respond with "https://www.emiratesnbd.com/cysi"
    And I send message "I need to change my billing cycle"
    Then Bot should respond with "https://www.emiratesnbd.com/cyccbc"
    And I send message "I want to skip loan payment for this time"
    Then Bot should respond with "https://www.emiratesnbd.com/dylp"
    And I send message "I want to convert transactions to installments"
    Then Bot should respond with "https://www.emiratesnbd.com/ippr"
    And I send message "I want to convert to 0 percent installement"
    Then Bot should respond with "https://www.emiratesnbd.com/zpippr"
    And I send message "I want to convert balance to installment"
    Then Bot should respond with "https://www.emiratesnbd.com/ibcpr"
    And I send message "I want to cancel ipp"
    Then Bot should respond with "https://www.emiratesnbd.com/ippcr"
    And I send message "I want to close loan on card"
    Then Bot should respond with "https://www.emiratesnbd.com/loccr"
    And I send message "I was facing an issue with my local transfer"
    Then Bot should respond with "https://www.emiratesnbd.com/lorc"
    And I send message "I was facing an issue with my interanational transfer"
    Then Bot should respond with "https://www.emiratesnbd.com/iorc"
    And I send message "I need to track inward remittance"
    Then Bot should respond with "https://www.emiratesnbd.com/irr"





  Scenario: Website links in Menu flow-- [EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "KYC update" options
    # Then Bot should respond with "https://application.emiratesislamic.ae/en/kyc/cdd"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Standing Instruction" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/cyso"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Card Billing Cycle" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/cyccbc"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Defer Loan cycle" options
    # Then Bot should respond with  "http://www.emiratesislamic.ae/idr"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Convert to IPP" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/ippr"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Balcon request" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/bcr"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Cancel IPP" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/ippc"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Cancel cash on call" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/coccr"
    # And I send "Menu"
    # And I click on dynamic Menu options in Meta
    # And I click on "More Services" options
    # And I click on "More Services" dynamic Menu options
    # And I click on "Web Services" options
    # And I click on "Web Services" dynamic Menu options
    # And I click on "Local remittance" options
    # Then Bot should respond with "http://www.emiratesislamic.ae/dore"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "Web Services" options
    And I click on "Web Services" dynamic Menu options
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "International remittance" options
    Then Bot should respond with "http://www.emiratesislamic.ae/iore"
    And I send "Menu"
    And I click on dynamic Menu options in Meta
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "Web Services" options
    And I click on "Web Services" dynamic Menu options
    And I click on "More Services" options
    And I click on "More Services" dynamic Menu options
    And I click on "Inward remittance" options
    Then Bot should respond with "http://www.emiratesislamic.ae/airr"
    


Scenario: Website links in AI flow --[EIB]
    Given I open Whats Web
    Then I search for the "Meta EI New"
    And I selected the contact "Meta EI New"
    And I send message "#"
    Then Bot should respond with "Please type your query or type"
    And I send message "I need to update to emirates ID"
    Then Bot should respond with "Please"
    Then Bot should respond with "https://application.emiratesislamic.ae/en/kyc/cdd"
    And I send message "I need to cancel standing instruction"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/cyso"
    And I send message "I need to change my billing cycle"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/cyccbc"
    And I send message "I want to skip loan payment for this time"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/idr"
    And I send message "I want to convert transactions to installments"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/ippr"
    # And I send message "I want to convert to 0 percent installement"
    # Then Bot should respond with "https://www.emiratesnbd.com/zpippr"
    And I send message "I want to convert balance to installment"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/bcr"
    And I send message "I want to cancel ipp"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/ippc"
    And I send message "I want to close loan on card"
    Then Bot should respond with "Please"
    Then Bot should respond with "sorry"
    And I send message "I want to cancel cash on call"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/coccr"
    And I send message "I was facing an issue with my local transfer"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/dore"
    And I send message "I was facing an issue with my interanational transfer"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/iore"
    And I send message "I need to track inward remittance"
    Then Bot should respond with "Please"
    Then Bot should respond with "http://www.emiratesislamic.ae/airr"

