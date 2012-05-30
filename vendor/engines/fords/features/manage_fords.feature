@fords
Feature: Fords
  In order to have fords on my website
  As an administrator
  I want to manage fords

  Background:
    Given I am a logged in refinery user
    And I have no fords

  @fords-list @list
  Scenario: Fords List
   Given I have fords titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of fords
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @fords-valid @valid
  Scenario: Create Valid Ford
    When I go to the list of fords
    And I follow "Add New Ford"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 ford

  @fords-invalid @invalid
  Scenario: Create Invalid Ford (without naam)
    When I go to the list of fords
    And I follow "Add New Ford"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 fords

  @fords-edit @edit
  Scenario: Edit Existing Ford
    Given I have fords titled "A naam"
    When I go to the list of fords
    And I follow "Edit this ford" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of fords
    And I should not see "A naam"

  @fords-duplicate @duplicate
  Scenario: Create Duplicate Ford
    Given I only have fords titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of fords
    And I follow "Add New Ford"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 fords

  @fords-delete @delete
  Scenario: Delete Ford
    Given I only have fords titled UniqueTitleOne
    When I go to the list of fords
    And I follow "Remove this ford forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 fords
 