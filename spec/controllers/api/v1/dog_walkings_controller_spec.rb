# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::DogWalkingsController do
  before { Timecop.freeze(Time.now.to_date) }
  after { Timecop.return }

  describe 'POST create' do
    context 'when invalid' do
      it 'returns a http status code 422' do
        params = {
          dog_walking: {
            scheduled_on: '2018-11-21',
            price_value: 0,
            scheduled_duration: 30,
            latitude: 30.00,
            longitude: 12.00,
            started_at: nil,
            ended_at: nil,
            pets: [4]
          }
        }

        post :create, params: params

        expect(response).to have_http_status(422)
      end
    end

    context 'when valid' do
      context 'when creating a dogwalking record' do
        it 'returns a http status code 201' do
          pet = create(:pet)

          params = {
            dog_walking: {
              scheduled_on: '2018-11-21',
              price_value: 0,
              scheduled_duration: 30,
              latitude: 30.00,
              longitude: 12.00,
              started_at: nil,
              ended_at: nil,
              pets: [pet.id]
            }
          }

          post :create, params: params

          expect(response).to have_http_status(201)
        end

        it 'creates successfully' do
          pet = create(:pet)

          params = {
            dog_walking: {
              scheduled_on: '2018-11-21T22:44:32-02:00',
              price_value: 0,
              scheduled_duration: 30,
              latitude: 30.00,
              longitude: 12.00,
              started_at: nil,
              ended_at: nil,
              pets: [pet.id]
            }
          }

          expect { post :create, params: params }
            .to change { DogWalking.count }.by(1)
        end
      end
    end
  end

  describe 'GET show' do
    context 'when dogwalking record exists' do
      it 'returns a http status code 200' do
        create(:dog_walking, :in_progress, id: 1)

        get :show, params: { id: 1 }

        expect(response).to have_http_status(200)
      end

      it 'returns the dogwalking' do
        dog_walking = create(:dog_walking, started_at: Time.now, status: :in_progress)

        get :show, params: { id: dog_walking.id }

        json = JSON.parse(response.body)

        body = {
          'data' => {
            'id' => dog_walking.id.to_s,
            'type' => 'dog_walking',
            'attributes' => {
              'elapsed_time' => 'less than a minute',
              'status' => 'in_progress',
              'scheduled_on' => dog_walking.scheduled_on.to_s,
              'price_value' => '10.0',
              'scheduled_duration' => '30 minutes',
              'latitude' => nil,
              'longitude' => nil,
              'started_at' => '2018-11-29T00:00:00.000Z',
              'ended_at' => nil
            }
          }
        }
        expect(json).to match(body)
      end
    end
  end

  describe 'GET index' do
    context 'when querying page' do
      context 'when page is valid' do
        it 'returns http status code 200' do
          create(:dog_walking, scheduled_on: Time.now.tomorrow)
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
        create(:dog_walking, scheduled_on: Time.now.yesterday)
        dog_walking = create(:dog_walking, scheduled_on: Time.now.tomorrow)

        get :index, params: { only_scheduleds: true }

        json = JSON.parse(response.body)

        body = {
          'data' => [
            {
              'id' => dog_walking.id.to_s,
              'type' => 'dog_walking',
              'attributes' => {
                'status' => 'scheduled',
                'scheduled_on' => dog_walking.scheduled_on.to_s,
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
        dog_walking = create(:dog_walking, scheduled_on: Time.now.tomorrow)

        get :index

        json = JSON.parse(response.body)

        body = {
          'data' => [
            {
              'id' => dog_walking.id.to_s,
              'type' => 'dog_walking',
              'attributes' => {
                'status' => 'scheduled',
                'scheduled_on' => dog_walking.scheduled_on.to_s,
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
