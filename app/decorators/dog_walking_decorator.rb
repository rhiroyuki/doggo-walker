# frozen_string_literal: true

class DogWalkingDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  TO_MINUTES = 60

  def scheduled_duration
    distance_of_time_in_words(object.scheduled_duration * TO_MINUTES)
  end
end
