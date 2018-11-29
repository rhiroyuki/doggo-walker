# frozen_string_literal: true

class DogWalkingBuilder
  attr_reader :built_object, :pets, :params

  delegate :status=,
           :scheduled_on=,
           :price_value=,
           :scheduled_duration=,
           :latitude=,
           :longitude=,
           :started_at=,
           :ended_at=,
           :created_at=,
           :updated_at=,
           :pets=,
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
      dog_walking.set_pets params[:pets]
      dog_walking.set_price_value
    end
  end

  def valid?
    return true if built_object.valid? && valid_pets?

    false
  end

  def set_price_value
    built_object.price_value = calculate_price_value
  end

  def calculate_price_value
    case built_object.scheduled_duration
    when 30
      return 25 + ((built_object.pets.length - 1) * 15)
    when 60
      return 35 + ((built_object.pets.length - 1) * 20)
    end
  end

  def set_pets(ids)
    built_object.pets = Pet.where(id: ids)
  end

  private

  def valid_pets?
    return true if params[:pets].length == built_object.pets.length

    built_object.errors.add(:pets, 'Pet invalid or not found')

    false
  end
end
