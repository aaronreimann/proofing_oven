Given /^I am signed in$/ do
  @user ||= Fabricate(:user)
  When %(I go to the sign in page)
  And %(I fill in "Email" with "#{@user.email}")
  And %(I fill in "Password" with "password")
  And %(I press "Sign in")
end
