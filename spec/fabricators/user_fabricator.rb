Fabricator(:confirmed_user, class_name: :user) do
  email { Fabricate.sequence(:email) { |i| "user#{i}@example.com" } }
  password "password"
end

Fabricator(:user, from: :confirmed_user) do
  password_confirmation "password"
  confirmed_at { Time.now }
  confirmation_token nil
end
