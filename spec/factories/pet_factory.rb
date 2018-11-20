# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { 'Hachi' }
    pet_owner
  end
end
