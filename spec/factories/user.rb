FactoryGirl.define do
  factory(:user) do
    email { Faker::Internet.email }
    password 'pw12345'
    username { Faker::Internet.user_name }
  end
end