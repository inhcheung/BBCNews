@WIP
Feature: News homepage
  As a user wanting to know more about the news
  Navigating to the BBC news channel seems quite a sensible thing to do
  But the contents and layout of the site must be verified!

  Scenario: Navigating to homepage
    Given I am on the BBC News home page
    Then A cookie message should appear
    And I should see the BBC News title
    And The main BBC header
    And The headline
    And The subsections
    And The Watch n Listen section
    And The BBC News Services section
    And The BBC Taster Footer

