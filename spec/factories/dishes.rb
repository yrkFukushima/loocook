FactoryBot.define do
  factory :dish do
    dish_1     {'test'}
    dish_2     {'test'}
    dish_3     {'test'}
    dish_4     {'test'}
    dish_5     {'test'}
    created_at {Faker::Time}
    association :user
  end
end
