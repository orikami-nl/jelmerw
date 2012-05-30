@vws
Feature: Vws
  In order to have vws on my website
  As an administrator
  I want to manage vws

  Background:
    Given I am a logged in refinery user
    And I have no vws

  @vws-list @list
  Scenario: Vws List
   Given I have vws titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of vws
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @vws-valid @valid
  Scenario: Create Valid Vw
    When I go to the list of vws
    And I follow "Add New Vw"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 vw

  @vws-invalid @invalid
  Scenario: Create Invalid Vw (without naam)
    When I go to the list of vws
    And I follow "Add New Vw"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 vws

  @vws-edit @edit
  Scenario: Edit Existing Vw
    Given I have vws titled "A naam"
    When I go to the list of vws
    And I follow "Edit this vw" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of vws
    And I should not see "A naam"

  @vws-duplicate @duplicate
  Scenario: Create Duplicate Vw
    Given I only have vws titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of vws
    And I follow "Add New Vw"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 vws

  @vws-delete @delete
  Scenario: Delete Vw
    Given I only have vws titled UniqueTitleOne
    When I go to the list of vws
    And I follow "Remove this vw forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 vws
 