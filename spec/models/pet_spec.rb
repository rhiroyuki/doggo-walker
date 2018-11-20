# frozen_string_literal: true

require 'rails_helper'

describe Pet do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:pet_owner) }
  end
end
