# frozen_string_literal: true

require 'rails_helper'

describe DogWalking do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:price_value) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:pets) }
  end
end
