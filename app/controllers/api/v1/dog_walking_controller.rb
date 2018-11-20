# frozen_string_literal: true

module Api
  module V1
    class DogWalkingController < Api::ApiController
      def index
        @dog_walkings = DogWalkingSerializer.new(DogWalking.all).serializable_hash

        render json: @dog_walkings, status: :ok
      end
    end
  end
end
