# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'api-pagination'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'draper', '~> 3.0.1'
gem 'fast_jsonapi', '~>1.5'
gem 'pagy', '~> 1.1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pry-rails', '~>0.3.7'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'time_difference'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'timecop', '~> 0.9.1'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec_junit_formatter'
  gem 'rubocop', '~> 0.60.0', require: false
  gem 'shoulda-matchers', git:
    'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
