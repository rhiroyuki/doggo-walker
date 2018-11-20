# frozen_string_literal: true

FactoryBot.define do
  factory :dog_walking do
    price_value { 10.0 }

    trait :with_dogs do
      pets { build_list(:pet, 5) }
    end
  end
end
