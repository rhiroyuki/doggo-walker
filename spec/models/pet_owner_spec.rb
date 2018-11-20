# frozen_string_literal: true

require 'rails_helper'

describe PetOwner do
  describe 'associations' do
    it { is_expected.to have_many(:pets) }
  end
end
