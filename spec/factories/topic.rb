FactoryGirl.define do
  factory(:topic) do
    name {Faker::Company.catch_phrase}
    association :category
  end
end