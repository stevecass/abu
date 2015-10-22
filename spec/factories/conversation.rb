FactoryGirl.define do
  factory(:conversation) do
    name Faker::Commerce.product_name
    association :topic, factory: :topic
    association :author, factory: :user
  end
end
