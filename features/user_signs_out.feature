@http://www.pivotaltracker.com/story/show/13888227 @accounts
Feature: User signs out
  In order to keep my account secure
  As a signed in user
  I want to sign out

  - Sign out link is present
  - Following link ends user session

  Scenario:
    Given I am signed in
    When I follow "Sign out"
    Then I should not see "Sign out"
    And I should see "Sign in"
