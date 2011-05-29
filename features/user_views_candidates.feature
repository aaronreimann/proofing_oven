@http://www.pivotaltracker.com/story/show/13888233 @candidates
Feature: User views candidates
  In order to hire amazing people
  As a signed in user
  I want to see a list of candidates

  - Candidates page displays all candidates
  - Sorted by last name, first name
  - Fields displayed include:
  -- Name (last, first)
  -- Phone
  -- Email
  -- Github
  -- Twitter
  -- Local
  -- Willing to Relocate
  -- Added On
  -- Status (pending, hired, rejected)

  Scenario:
    Given the following candidate:
      | first name          | Aaron                   |
      | last name           | Reimann                 |
      | phone               | 4048892784              |
      | email               | aaron.reimann@gmail.com |
      | github              | aaronreimann            |
      | twitter             | areimann                |
      | local               | false                   |
      | willing to relocate | true                    |
      | created at          | 2011-05-25              |
      | status              | pending                 |
    And I am signed in
    When I follow "Candidates"
    Then I should see the following table:
      | Name          | Phone      | Email                   | Github       | Twitter  | Local | Willing to Relocate | Added On   | Status  |
      | Aaron Reimann | 4048892784 | aaron.reimann@gmail.com | aaronreimann | areimann | No    | Yes                 | 2011-05-25 | pending |
