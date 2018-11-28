# frozen_string_literal: true

class DogWalkingBuilder
  attr_reader :built_object, :pets, :params

  delegate :status=,
           :scheduled_on=,
           :price_value=,
           :scheduled_duration=,
           :latitude=,
           :longitude=,
           :started_time=,
           :ended_time=,
           :created_at=,
           :updated_at=,
           to: :built_object

  delegate :save,
           :errors,
           to: :built_object

  def initialize(built_object_class: DogWalking, params: {}, &block)
    @built_object = built_object_class.new(params.except(:pets))
    @params = params

    yield(self) if block_given?
  end

  def self.call(params)
    new(params: params) do |dog_walking|
      dog_walking.pets = params[:pets]
    end
  end

  def valid?
    return true if valid_pets? && built_object.valid?

    built_object.errors.add(:pets, 'Pet invalid or not found')
    false
  end

  def pets=(ids)
    built_object.pets = Pet.where(id: ids)
  end

  private

  def valid_pets?
    params[:pets].count == built_object.pets.size
  end
end
