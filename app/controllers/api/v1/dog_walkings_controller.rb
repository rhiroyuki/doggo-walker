# frozen_string_literal: true

module Api
  module V1
    class DogWalkingsController < Api::ApiController
      def index
        @dog_walkings = if params[:only_scheduleds] == 'false'
                          DogWalking.all
                        else
                          DogWalking.where('scheduled_at > ?', Time.now.to_date)
                        end

        @pagy, @records = pagy(@dog_walkings, items: 20)

        pagy_serialized = {
          page: @pagy.page,
          pages: @pagy.pages,
          items: @pagy.items
        }

        options = { meta: pagy_serialized }
        dog_serializer = DogWalkingSerializer.new(@records.decorate(context: { paginate: @pagy }), options).serializable_hash

        render json: dog_serializer, status: :ok
      end
    end
  end
end
