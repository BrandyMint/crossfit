FactoryGirl.define do
  factory :log do
    user
    workout
    wod
    date { generate :date }
  end
end
