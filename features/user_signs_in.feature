@http://www.pivotaltracker.com/story/show/13888225 @accounts
Feature: User signs in
  In order to manage my applicants
  As a registered user
  I want to sign into my account

  - Front page displays sign in link
  - Following link takes guest to sign in form
  - Valid email and password sign in user
  - Invalid combination displays error

  Background:
    Given the following user:
      | first name | Aaron            |
      | last name  | Reimann          |
      | email      | aaron@myface.com |
      | password   | password         |
    And I am on the home page
    And I follow "Sign in"

  Scenario: Success
    When I fill in "Email" with "aaron@myface.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in as Aaron Reimann"

  Scenario: Invalid email
    When I press "Sign in"
    Then I should see "Invalid email or password"

  Scenario: Invalid password
    When I fill in "Email" with "aaron@myface.com"
    And I fill in "Password" with "invalid"
    And I press "Sign in"
    Then I should see "Invalid email or password"
