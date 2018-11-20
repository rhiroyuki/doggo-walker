# frozen_string_literal: true

require 'rails_helper'

describe DogWalking do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:price_value) }
  end
end
