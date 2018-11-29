# frozen_string_literal: true

FactoryBot.define do
  factory :dog_walking do
    price_value { 10.0 }
    scheduled_duration { 30 }
    scheduled_on { Time.now }

    trait :in_progress do
      started_at { Time.now }
      status { :in_progress }
    end

    trait :with_dogs do
      pets { build_list(:pet, 5) }
    end
  end
end
