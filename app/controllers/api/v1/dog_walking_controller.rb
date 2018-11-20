# frozen_string_literal: true

module Api
  module V1
    class DogWalkingController < Api::ApiController
      def index
        @dog_walkings = if params[:only_scheduleds] == 'false'
                          DogWalking.all
                        else
                          DogWalking.where('scheduled_at > ?', Time.now.to_date)
                        end

        dog_serializer = DogWalkingSerializer.new(@dog_walkings)
                                             .serializable_hash

        render json: dog_serializer, status: :ok
      end
    end
  end
end
