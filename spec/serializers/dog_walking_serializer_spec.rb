# frozen_string_literal: true

require 'rails_helper'

describe DogWalkingSerializer do
  before { Timecop.freeze(2018, 11, 11) }
  after { Timecop.return }

  let(:dog_walking) do
    build(:dog_walking,
          scheduled_on: 1.day.ago,
          status: :finished,
          price_value: 15,
          scheduled_duration: 30,
          latitude: 123,
          longitude: 321,
          started_at: 1.hour.ago,
          ended_at: Time.now)
  end

  subject { described_class.new(dog_walking).serializable_hash[:data][:attributes] }

  describe 'attributes' do
    it 'shows status' do
      expect(subject[:status]).to eq 'finished'
    end

    it 'shows price value' do
      expect(subject[:price_value]).to eq 15
    end

    it 'shows scheduled duration' do
      expect(subject[:scheduled_duration]).to eq 30
    end

    it 'shows the latitude' do
      expect(subject[:latitude]).to eq 123
    end

    it 'shows the longitude' do
      expect(subject[:longitude]).to eq 321
    end

    it 'shows the started_at' do
      expect(subject[:started_at]).to eq dog_walking.started_at.to_s
    end

    it 'shows the ended_at' do
      expect(subject[:ended_at]).to eq dog_walking.ended_at.to_s
    end

    it 'shows scheduled on' do
      expect(subject[:scheduled_on]).to eq dog_walking.scheduled_on
    end
  end
end
