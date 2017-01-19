FactoryGirl.define do
  factory :issue do
    title { Faker::Book.title }
    description { Faker::Hipster.paragraph }
    creator
    assignee nil
  end
end
