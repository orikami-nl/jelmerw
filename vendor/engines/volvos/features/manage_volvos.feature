@volvos
Feature: Volvos
  In order to have volvos on my website
  As an administrator
  I want to manage volvos

  Background:
    Given I am a logged in refinery user
    And I have no volvos

  @volvos-list @list
  Scenario: Volvos List
   Given I have volvos titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of volvos
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @volvos-valid @valid
  Scenario: Create Valid Volvo
    When I go to the list of volvos
    And I follow "Add New Volvo"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 volvo

  @volvos-invalid @invalid
  Scenario: Create Invalid Volvo (without naam)
    When I go to the list of volvos
    And I follow "Add New Volvo"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 volvos

  @volvos-edit @edit
  Scenario: Edit Existing Volvo
    Given I have volvos titled "A naam"
    When I go to the list of volvos
    And I follow "Edit this volvo" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of volvos
    And I should not see "A naam"

  @volvos-duplicate @duplicate
  Scenario: Create Duplicate Volvo
    Given I only have volvos titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of volvos
    And I follow "Add New Volvo"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 volvos

  @volvos-delete @delete
  Scenario: Delete Volvo
    Given I only have volvos titled UniqueTitleOne
    When I go to the list of volvos
    And I follow "Remove this volvo forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 volvos
 