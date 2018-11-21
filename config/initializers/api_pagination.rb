# frozen_string_literal: true

ApiPagination.configure do |config|
  config.page_header = 'X-Page'

  config.page_param = :page
end
