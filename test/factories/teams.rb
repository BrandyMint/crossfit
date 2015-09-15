FactoryGirl.define do
  sequence(:team_title) { |n| "team#{n}" }
  sequence(:team_slug) { |n| "slug#{n}" }
  factory :team do
    title { generate :team_title }
    title { generate :team_slug }
    owner
  end
end
