# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::DogWalkingController do
  describe 'GET index' do
    context 'when retrieving all dogwalkings' do
      it 'returns a 200 http status code' do
        get :index

        expect(response).to have_http_status(200)
      end

      it 'returns the body' do
        create(:dog_walking)

        get :index

        json = JSON.parse(response.body)

        body = {
          'data' => [
            {
              'id' => '1',
              'type' => 'dog_walking',
              'attributes' => {
                'status' => 0,
                'scheduled_at' => nil,
                'price_value' => '10.0',
                'scheduled_duration' => 0,
                'latitude' => nil,
                'longitude' => nil,
                'started_at' => nil,
                'ended_at' => nil
              }
            }
          ]
        }
        expect(json).to match(body)
      end
    end
  end
end
