# frozen_string_literal: true

class DogWalking < ApplicationRecord
  scope :scheduleds, ->(time = Time.now.to_date) { where('scheduled_on > ?', time) }

  has_and_belongs_to_many :pets, inverse_of: :dog_walking

  validates :price_value, presence: true

  enum status: %i[scheduled in_progress finished cancelled]
end
