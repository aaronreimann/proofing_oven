@http://www.pivotaltracker.com/story/show/13888231 @accounts @email
Feature: User resets password
  In order to access my account
  As a user who can't sign in
  I want to reset my password

  - Sign in page displays forgot password link
  - Following link displays form with the following:
  -- Email
  - Submitting form emails user a link to reset password
  - Following link in email displays form with the following:
  -- New password
  -- Confirm password
  - Submitting form resets password

  Scenario:
    Given the following user:
      | email | bob@bob.com |
    And I am on the sign in page
    When I follow "Forgot Password"
    And I fill in "Email" with "bob@bob.com"
    And I press "Send me reset password instructions"
    Then "bob@bob.com" should receive an email
    When I open the email
    And I click the first link in the email
    And I fill in "New password" with "password"
    And I fill in "Confirm new password" with "password"
    And I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."
