# frozen_string_literal: true

module Api
  module V1
    class DogWalkingsController < Api::ApiController
      def index
        dog_walkings = paginate dog_walking_scope, per_page: 20

        dog_serializer = DogWalkingSerializer.new(dog_walkings.decorate)

        render json: dog_serializer, status: :ok
      end

      def show
        dog_walking = DogWalking.find(params[:id]).decorate

        render json: DogWalkingSerializer.new(dog_walking), status: 200
      end

      def create
        dog_walking = DogWalkingBuilder.call(dog_walking_params)

        if dog_walking.valid?
          dog_walking.save

          render dog_walking.to_json, status: 201
        else
          render json: { errors: dog_walking.errors.full_messages }, status: 422
        end
      end

      private

      def dog_walking_params
        params
          .require(:dog_walking)
          .permit(
            :scheduled_on,
            :price_value,
            :scheduled_duration,
            :latitude,
            :longitude,
            :started_time,
            :ended_time,
            pets: []
          )
      end

      def dog_walking_scope
        return DogWalking.all unless only_scheduleds?

        DogWalking.scheduleds
      end

      def only_scheduleds?
        ['true', 1, '1'].include? params[:only_scheduleds]
      end
    end
  end
end
