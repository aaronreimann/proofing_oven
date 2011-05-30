@http://www.pivotaltracker.com/story/show/13888239 @candidates
Feature: User adds candidate
  In order to hire amazing people
  As a user viewing the candidate list
  I want to add a new candidate

  - Candidate list page has link to add new candidate
  - Following link takes user to new candidate form
  - Fields include
  -- first name
  -- last name
  -- email
  -- contact phone
  -- status (pending, hired, rejected)
  -- github id
  -- twitter id
  -- local?
  -- willing to relocate?

  Scenario:
    Given I am signed in
    When I follow "Candidates"
    And I follow "Add New Candidate"
    And I fill in "First name" with "Aaron"
    And I fill in "Last name" with "Reimann"
    And I fill in "Email" with "aaron.reimann@gmail.com"
    And I fill in "Phone" with "4048892784"
    And I select "pending" from "Status"
    And I fill in "Github" with "aaronreimann"
    And I fill in "Twitter" with "areimann"
    And uncheck "Local"
    And I check "Willing to relocate"
    When I press "Add Candidate"
    Then I should see "Candidate saved successfully"
