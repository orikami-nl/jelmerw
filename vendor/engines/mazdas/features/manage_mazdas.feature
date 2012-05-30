@mazdas
Feature: Mazdas
  In order to have mazdas on my website
  As an administrator
  I want to manage mazdas

  Background:
    Given I am a logged in refinery user
    And I have no mazdas

  @mazdas-list @list
  Scenario: Mazdas List
   Given I have mazdas titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of mazdas
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @mazdas-valid @valid
  Scenario: Create Valid Mazda
    When I go to the list of mazdas
    And I follow "Add New Mazda"
    And I fill in "Naam" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 mazda

  @mazdas-invalid @invalid
  Scenario: Create Invalid Mazda (without naam)
    When I go to the list of mazdas
    And I follow "Add New Mazda"
    And I press "Save"
    Then I should see "Naam can't be blank"
    And I should have 0 mazdas

  @mazdas-edit @edit
  Scenario: Edit Existing Mazda
    Given I have mazdas titled "A naam"
    When I go to the list of mazdas
    And I follow "Edit this mazda" within ".actions"
    Then I fill in "Naam" with "A different naam"
    And I press "Save"
    Then I should see "'A different naam' was successfully updated."
    And I should be on the list of mazdas
    And I should not see "A naam"

  @mazdas-duplicate @duplicate
  Scenario: Create Duplicate Mazda
    Given I only have mazdas titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of mazdas
    And I follow "Add New Mazda"
    And I fill in "Naam" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 mazdas

  @mazdas-delete @delete
  Scenario: Delete Mazda
    Given I only have mazdas titled UniqueTitleOne
    When I go to the list of mazdas
    And I follow "Remove this mazda forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 mazdas
 