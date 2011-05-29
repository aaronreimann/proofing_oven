@http://www.pivotaltracker.com/story/show/13888235 @candidates
Feature: User views candidate
  In order to hire amazing people
  As a user viewing candidates
  I want to view the details for a candidate

  - Candidate name in candidate list links to show page
  - Show page displays the following fields:
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
    Given the following candidate:
      | first name          | Aaron                   |
      | last name           | Reimann                 |
      | email               | aaron.reimann@gmail.com |
      | phone               | 4048892784              |
      | status              | Pending                 |
      | github              | aaronreimann            |
      | twitter             | areimann                |
      | local               | false                   |
      | willing to relocate | true                    |
      | created at          | 2011-05-28              |
    And I am signed in
    When I follow "Candidates"
    And I follow "Aaron Reimann"
    Then I should see "Aaron Reimann"
    And I should see "Pending" in the "Status" section
    And I should see "aaron.reimann@gmail.com" in the "Email" section
    And I should see "4048892784" in the "Phone" section
    And I should see "aaronreimann" in the "Github" section
    And I should see "areimann" in the "Twitter" section
    And I should see "No" in the "Local" section
    And I should see "Yes" in the "Willing to Relocate" section
    And I should see "2011-05-28" in the "Added On" section
