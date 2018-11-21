# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::DogWalkingsController do
  before { Timecop.freeze(Time.now.to_date) }
  after { Timecop.return }

  describe 'GET index' do
    context 'when querying page' do
      context 'when page is valid' do
        it 'returns http status code 200' do
          create(:dog_walking, scheduled_at: Time.now.tomorrow)
          get :index, params: { page: 1 }

          expect(response).to have_http_status(200)
        end
      end

      context 'when page is invalid' do
        it 'returns http status code 404' do
          get :index, params: { page: 2 }

          expect(response).to have_http_status(404)
        end
      end
    end

    context 'when retrieving the scheduled ones' do
      it 'returns a 200 http status code' do
        get :index, params: { only_scheduleds: true }

        expect(response).to have_http_status(200)
      end

      it 'returns the body' do
        create(:dog_walking, scheduled_at: Time.now.yesterday)
        dog_walking = create(:dog_walking, scheduled_at: Time.now.tomorrow)

        get :index, params: { only_scheduleds: true }

        json = JSON.parse(response.body)

        body = {
          'data' => [
            {
              'id' => dog_walking.id.to_s,
              'type' => 'dog_walking',
              'attributes' => {
                'status' => 'scheduled',
                'scheduled_at' => dog_walking.scheduled_at,
                'price_value' => '10.0',
                'scheduled_duration' => '30 minutes',
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

    context 'when retrieving all dogwalkings' do
      it 'returns a 200 http status code' do
        get :index

        expect(response).to have_http_status(200)
      end

      it 'returns the body' do
        dog_walking = create(:dog_walking, scheduled_at: Time.now.tomorrow)

        get :index

        json = JSON.parse(response.body)

        body = {
          'data' => [
            {
              'id' => dog_walking.id.to_s,
              'type' => 'dog_walking',
              'attributes' => {
                'status' => 'scheduled',
                'scheduled_at' => dog_walking.scheduled_at,
                'price_value' => '10.0',
                'scheduled_duration' => '30 minutes',
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
