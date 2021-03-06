Feature: OSB Emissions Fix - Book service for RTC retailers (VWOSBEB-2)
  As a Car owner who has received an emissions fix notification
  I want to Book the emissions fix online (with an RTC retailer)
  So that I can have my car fixed

Background: pre-requisites
  Given the user is on the OSB first page "Choose Retailer"
  And has selected an RTC retailer: AAAA

Scenario: my car is on the affected VINs list - the emissions fix work should be available in the list FOC
  Given my car is on the affected cars list and i have entered the reg number on the stage 'Your Vehicle'
  When I get to the “Select work” step on the OSB and select any service
  And I choose a date and time in "Select date"
  Then the emissions fix work should be available on top of work list
  And it should be selected by default
  But I should be able to deselect it
  And I should be able to select any other additional work for my car


Scenario: I have selected the emissions fix work : the Convenience options should be FOC
  Given I have just entered the vehicle reg with an affected car
  When I get to the Convenience options
  Then I should see 'emissions fix' along with other
  Then all the convenience options should be free of charge


Scenario Outline: the 'Real time' (to be taken out of diary) depends on my engine size (for Non-Manheim RTC retailers)
  Given I am on the "Your Vehicle" page
  When I have provided my car reg number
  Then 3rd party experian should return car details engine incl. engine <size>
  When I match the engine size from experian with the ones configured on RCMS
  Then the work code shown in RCMS diary should be <job>
  And the engine fix time shown in RCMS diary should be <time>

  Examples:
  |size|job                |time|
  |1.2 |Emission Engine Fix|0.6 |
  |1.6 |Emission Engine Fix|0.85|
  |2.0 |Emission Engine Fix|0.6 |


Scenario Outline: the 'Real time' (to be taken out of diary) depends on my engine size (for Manheim RTC retailers)
  Given I am on the "Your Vehicle" page
  When I have provided my car reg number
  Then 3rd party experian should return car details engine incl. engine <size>
  When I match the engine size from experian with the ones configured on Manheim RTC (require Manheim to check from this point)
  Then the work code shown in Manheim RTC should be <job>
  And the engine fix time shown in Manheim RTC should be <time>

  Examples:
  |size|job                |time|
  |1.2 |Emission Engine Fix|0.6 |
  |1.6 |Emission Engine Fix|0.85|
  |2.0 |Emission Engine Fix|0.6 |