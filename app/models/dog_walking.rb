# frozen_string_literal: true

class DogWalking < ApplicationRecord
  scope :scheduleds, ->(time = Time.now.to_date) { where('scheduled_on > ?', time) }

  has_and_belongs_to_many :pets

  validates :price_value, presence: true
  validates :scheduled_duration, inclusion: [30, 60]

  enum status: %i[scheduled in_progress finished cancelled]
end
