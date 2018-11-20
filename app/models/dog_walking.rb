# frozen_string_literal: true

class DogWalking < ApplicationRecord
  has_and_belongs_to_many :pets

  validates :price_value, presence: true
end
