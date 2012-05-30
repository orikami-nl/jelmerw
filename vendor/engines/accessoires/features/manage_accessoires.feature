@accessoires
Feature: Accessoires
  In order to have accessoires on my website
  As an administrator
  I want to manage accessoires

  Background:
    Given I am a logged in refinery user
    And I have no accessoires

  @accessoires-list @list
  Scenario: Accessoires List
   Given I have accessoires titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of accessoires
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @accessoires-valid @valid
  Scenario: Create Valid Accessoire
    When I go to the list of accessoires
    And I follow "Add New Accessoire"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 accessoire

  @accessoires-invalid @invalid
  Scenario: Create Invalid Accessoire (without title)
    When I go to the list of accessoires
    And I follow "Add New Accessoire"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 accessoires

  @accessoires-edit @edit
  Scenario: Edit Existing Accessoire
    Given I have accessoires titled "A title"
    When I go to the list of accessoires
    And I follow "Edit this accessoire" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of accessoires
    And I should not see "A title"

  @accessoires-duplicate @duplicate
  Scenario: Create Duplicate Accessoire
    Given I only have accessoires titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of accessoires
    And I follow "Add New Accessoire"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 accessoires

  @accessoires-delete @delete
  Scenario: Delete Accessoire
    Given I only have accessoires titled UniqueTitleOne
    When I go to the list of accessoires
    And I follow "Remove this accessoire forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 accessoires
 