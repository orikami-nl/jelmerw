@bmws
Feature: Bmws
  In order to have bmws on my website
  As an administrator
  I want to manage bmws

  Background:
    Given I am a logged in refinery user
    And I have no bmws

  @bmws-list @list
  Scenario: Bmws List
   Given I have bmws titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of bmws
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @bmws-valid @valid
  Scenario: Create Valid Bmw
    When I go to the list of bmws
    And I follow "Add New Bmw"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 bmw

  @bmws-invalid @invalid
  Scenario: Create Invalid Bmw (without naam)
    When I go to the list of bmws
    And I follow "Add New Bmw"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 bmws

  @bmws-edit @edit
  Scenario: Edit Existing Bmw
    Given I have bmws titled "A naam"
    When I go to the list of bmws
    And I follow "Edit this bmw" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of bmws
    And I should not see "A naam"

  @bmws-duplicate @duplicate
  Scenario: Create Duplicate Bmw
    Given I only have bmws titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of bmws
    And I follow "Add New Bmw"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 bmws

  @bmws-delete @delete
  Scenario: Delete Bmw
    Given I only have bmws titled UniqueTitleOne
    When I go to the list of bmws
    And I follow "Remove this bmw forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 bmws
 