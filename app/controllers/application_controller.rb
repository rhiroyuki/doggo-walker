# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  rescue_from Pagy::OverflowError, with: :raise_not_found

  def raise_not_found
    render 'not found', status: 404
  end
end
