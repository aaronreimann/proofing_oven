@http://www.pivotaltracker.com/story/show/13888229 @accounts
Feature: User signs up
  In order to manage my applicants
  As a guest on the front page
  I want to create an account

  - Front page displays sign up link
  - Following sign up takes guest to sign up form
  - Required fields are email, password, and password confirm
  - Password and confirm must match

  Background:
    Given I am on the home page
    And I follow "Sign up"

  Scenario: successful
    When I fill in "Email" with "bob@bob.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirm" with "password"
    And I press "Sign Up"
    Then I should see "You need to sign in or sign up before continuing."
    And "bob@bob.com" should receive an email

  Scenario: invalid email
    When I press "Sign Up"
    Then I should see "Email can't be blank"
    And I should see "Password can't be blank"

  Scenario: passwords must match
    When I fill in "Email" with "bob@bob.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password-shizhil"
    And I press "Sign Up"
    Then I should see "Password doesn't match confirmation"
