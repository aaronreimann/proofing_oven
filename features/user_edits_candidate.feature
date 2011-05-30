@http://www.pivotaltracker.com/story/show/13888237 @candidates
Feature: User edits candidate
  In order to keep candidate data pristine
  As a user viewing a candidate
  I want to edit the candidate

  - Candidate page displays edit link
  - Following link displays candidate form
  -- first name
  -- last name
  -- email
  -- contact phone
  -- status (pending, hired, rejected)
  -- github id
  -- twitter id
  -- local?
  -- willing to relocate?
  - Submitting form displays updated candidate

  Scenario:
    Given the following candidate:
      | first name | Aaron   |
      | last name  | Reimann |
    And I am signed in
    When I follow "Candidates"
    And I follow "Aaron Reimann"
    And I follow "Edit Candidate"
    And I fill in "First name" with "Aaron"
    And I fill in "Last name" with "Reimann"
    And I fill in "Email" with "aaron.reimann@gmail.com"
    And I fill in "Phone" with "4048892784"
    And I select "pending" from "Status"
    And I fill in "Github" with "aaronreimann"
    And I fill in "Twitter" with "areimann"
    And uncheck "Local"
    And I check "Willing to relocate"
    When I press "Save Candidate"
    Then I should see "Candidate saved successfully"
