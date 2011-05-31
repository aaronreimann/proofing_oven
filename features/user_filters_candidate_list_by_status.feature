@http://www.pivotaltracker.com/story/show/13888263 @candidates @filtering
Feature: User filters candidate list by status
  In order to locate a candidate
  As a user viewing the candidate list
  I want to filter by status

  - Candidate list page displays status filter
  - Choosing a status restricts the results to candidates with that status

  Background:
    Given the following candidates:
      | first name | last name | status  |
      | Jane       | Doe       | hired   |
      | John       | Smith     | pending |
    And I am signed in
    And I follow "Candidates"

  Scenario:
    When I select "pending" from "Status"
    And I press "Filter"
    Then I should see "John Smith"
    And I should not see "Jane Doe"

  Scenario: Filter is display all
    When I select "Display All" from "Status"
    And I press "Filter"
    Then I should see "John Smith"
    And I should see "Jane Doe"

  Scenario: Persisting status filter criteria
    When I select "pending" from "Status"
    And I press "Filter"
    Then "Status" should have "pending" selected
