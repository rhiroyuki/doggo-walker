# frozen_string_literal: true

require 'rails_helper'

describe DogWalkingBuilder do
  describe 'delegations' do
    it { is_expected.to delegate_method(:status=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:scheduled_on=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:price_value=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:scheduled_duration=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:latitude=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:longitude=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:started_time=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:ended_time=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:created_at=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:updated_at=).with_arguments(anything).to(:built_object) }
    it { is_expected.to delegate_method(:save).to(:built_object) }
    it { is_expected.to delegate_method(:errors).to(:built_object) }
  end

  describe '#call' do
    context 'when successfull' do
      it 'builds a dogwalking with its attributes' do
        dog_walking_attributes = attributes_for(:dog_walking, latitude: 12.3)

        dog_walking = described_class.call(dog_walking_attributes).built_object
        expect(dog_walking.latitude).to eq(12.3)
      end
    end
  end

  describe '.set_price_value' do
    context 'when scheduled duration is 30' do
      context 'with 2 dogs' do
        it 'returns 40 reais' do
          pets = create_list(:pet, 2)
          dog_walking_attributes = attributes_for(
            :dog_walking,
            scheduled_duration: 30,
            pets: pets.map(&:id)
          )

          dog_walking = described_class.call(dog_walking_attributes).built_object

          expect(dog_walking.price_value).to eq(40)
        end
      end

      context 'with 1 dog' do
        it 'returns 25 reais' do
          pets = create_list(:pet, 1)
          dog_walking_attributes = attributes_for(
            :dog_walking,
            scheduled_duration: 30,
            pets: pets.map(&:id)
          )

          dog_walking = described_class.call(dog_walking_attributes).built_object

          expect(dog_walking.price_value).to eq(25)
        end
      end
    end

    context 'when scheduled duration is 60' do
      context 'with 2 dogs' do
        it 'returns 55 reais' do
          pets = create_list(:pet, 2)
          dog_walking_attributes = attributes_for(
            :dog_walking,
            scheduled_duration: 60,
            pets: pets.map(&:id)
          )

          dog_walking = described_class.call(dog_walking_attributes).built_object

          expect(dog_walking.price_value).to eq(55)
        end
      end

      context 'with 1 dog' do
        it 'returns 35 reais' do
          pets = create_list(:pet, 1)
          dog_walking_attributes = attributes_for(
            :dog_walking,
            scheduled_duration: 60,
            pets: pets.map(&:id)
          )

          dog_walking = described_class.call(dog_walking_attributes).built_object

          expect(dog_walking.price_value).to eq(35)
        end
      end
    end
  end

  describe '.valid?' do
    context 'when all pet ids are found' do
      it 'is valid' do
        pets = create_list(:pet, 2)
        dog_walking = attributes_for(:dog_walking, pets: pets.map(&:id))

        expect(described_class.call(dog_walking).valid?).to be_truthy
      end
    end

    context 'when not all pet ids are found' do
      it 'is not valid' do
        dog_walking = attributes_for(:dog_walking, pets: [123])

        expect(described_class.call(dog_walking).valid?).to be_falsy
      end
    end
  end
end
