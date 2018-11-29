# frozen_string_literal: true

class DogWalkingSerializer
  include FastJsonapi::ObjectSerializer

  attributes :status,
             :scheduled_on,
             :price_value,
             :scheduled_duration,
             :latitude,
             :longitude,
             :started_at,
             :ended_at

  attribute :elapsed_time, if: Proc.new { |record, params|
    params[:action] == 'show'
  }
end
