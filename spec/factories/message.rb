FactoryGirl.define do
  factory(:message) do
    content Faker::Lorem.sentence
    association :conversation, factory: :conversation
    association :user, factory: :user
  end
end