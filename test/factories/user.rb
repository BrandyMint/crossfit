FactoryGirl.define do
  factory :user do
    email { generate :email }
    password { generate :password }
  end
end
