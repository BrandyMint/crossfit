FactoryGirl.define do
  factory :wod do
    workout
    date { generate :date }
  end
end
