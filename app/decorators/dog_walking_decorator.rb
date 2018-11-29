# frozen_string_literal: true

class DogWalkingDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  TO_MINUTES = 60

  def scheduled_duration
    distance_of_time_in_words(object.scheduled_duration * TO_MINUTES)
  end

  def elapsed_time
    return distance_of_time_in_words(object.started_at - Time.now) unless object.finished?

    distance_of_time_in_words(object.started_at - object.ended_at)
  end
end
