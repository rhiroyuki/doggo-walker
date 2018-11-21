# frozen_string_literal: true

module Api
  module V1
    class DogWalkingsController < Api::ApiController
      def index
        dog_walkings = paginate dog_walking_scope, per_page: 20

        dog_serializer = DogWalkingSerializer.new(dog_walkings.decorate)

        render json: dog_serializer, status: :ok
      end

      private

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
