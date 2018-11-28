# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :pet_owner
  has_and_belongs_to_many :dog_walkings, inverse_of: :pet

  validates :name, presence: true
end
