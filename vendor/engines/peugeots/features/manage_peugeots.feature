@peugeots
Feature: Peugeots
  In order to have peugeots on my website
  As an administrator
  I want to manage peugeots

  Background:
    Given I am a logged in refinery user
    And I have no peugeots

  @peugeots-list @list
  Scenario: Peugeots List
   Given I have peugeots titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of peugeots
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @peugeots-valid @valid
  Scenario: Create Valid Peugeot
    When I go to the list of peugeots
    And I follow "Add New Peugeot"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 peugeot

  @peugeots-invalid @invalid
  Scenario: Create Invalid Peugeot (without naam)
    When I go to the list of peugeots
    And I follow "Add New Peugeot"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 peugeots

  @peugeots-edit @edit
  Scenario: Edit Existing Peugeot
    Given I have peugeots titled "A naam"
    When I go to the list of peugeots
    And I follow "Edit this peugeot" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of peugeots
    And I should not see "A naam"

  @peugeots-duplicate @duplicate
  Scenario: Create Duplicate Peugeot
    Given I only have peugeots titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of peugeots
    And I follow "Add New Peugeot"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 peugeots

  @peugeots-delete @delete
  Scenario: Delete Peugeot
    Given I only have peugeots titled UniqueTitleOne
    When I go to the list of peugeots
    And I follow "Remove this peugeot forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 peugeots
 