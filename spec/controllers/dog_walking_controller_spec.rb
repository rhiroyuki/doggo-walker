# frozen_string_literal: true

require 'rails_helper'

describe DogWalkingController do
  describe 'GET index' do
    context 'when retrieving all dogwalkings' do
      it 'returns a 200 http status code' do
        get :index

        expect(response).to have_http_status(200)
      end
    end
  end
end
