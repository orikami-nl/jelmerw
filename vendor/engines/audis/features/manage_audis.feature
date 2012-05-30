@audis
Feature: Audis
  In order to have audis on my website
  As an administrator
  I want to manage audis

  Background:
    Given I am a logged in refinery user
    And I have no audis

  @audis-list @list
  Scenario: Audis List
   Given I have audis titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of audis
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @audis-valid @valid
  Scenario: Create Valid Audi
    When I go to the list of audis
    And I follow "Add New Audi"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 audi

  @audis-invalid @invalid
  Scenario: Create Invalid Audi (without naam)
    When I go to the list of audis
    And I follow "Add New Audi"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 audis

  @audis-edit @edit
  Scenario: Edit Existing Audi
    Given I have audis titled "A naam"
    When I go to the list of audis
    And I follow "Edit this audi" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of audis
    And I should not see "A naam"

  @audis-duplicate @duplicate
  Scenario: Create Duplicate Audi
    Given I only have audis titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of audis
    And I follow "Add New Audi"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 audis

  @audis-delete @delete
  Scenario: Delete Audi
    Given I only have audis titled UniqueTitleOne
    When I go to the list of audis
    And I follow "Remove this audi forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 audis
 