# frozen_string_literal:true

require 'rails_helper'

describe DogWalkingDecorator do
  describe '.scheduled_duration' do
    it 'returns the duration formatted' do
      dog_walking = build(:dog_walking, scheduled_duration: 30)
      decorated_dog_walking = described_class.decorate(dog_walking)

      expect(decorated_dog_walking.scheduled_duration).to eq('30 minutes')
    end
  end
end
