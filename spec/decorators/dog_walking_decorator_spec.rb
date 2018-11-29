# frozen_string_literal:true

require 'rails_helper'

describe DogWalkingDecorator do
  before { Timecop.freeze(2018,11, 12) }
  after { Timecop.return }

  describe '.scheduled_duration' do
    it 'returns the duration formatted' do
      dog_walking = build(:dog_walking, scheduled_duration: 30)
      decorated_dog_walking = described_class.decorate(dog_walking)

      expect(decorated_dog_walking.scheduled_duration).to eq('30 minutes')
    end
  end

  describe '.elapsed_time' do
    context 'when dog walking in progress' do
      it 'returns the difference based on the actual time' do
        dog_walking = build(:dog_walking, :in_progress, started_at: 1.hour.ago)
        decorated_dog_walking = described_class.decorate(dog_walking)

        expect(decorated_dog_walking.elapsed_time).to eq('about 1 hour')
      end
    end

    context 'when dog walking is not in progress' do
      it 'returns the difference with the ended time' do
        dog_walking = build(
          :dog_walking,
          status: :finished,
          started_at: 1.hour.ago,
          ended_at: Time.now)

        decorated_dog_walking = described_class.decorate(dog_walking)

        expect(decorated_dog_walking.elapsed_time).to eq('about 1 hour')
      end
    end
  end
end
