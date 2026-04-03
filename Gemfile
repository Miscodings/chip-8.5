source 'https://rubygems.org'

gem 'rails', '~> 7.1.5'
gem 'sprockets-rails'
gem 'faraday'
gem 'jquery-rails'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development do
  gem 'web-console'
end

group :development, :test do
  gem 'debug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'mechanize', '~> 2.10', '>= 2.10.1'
  gem 'sqlite3', '>= 1.4'
  gem 'webmock'
  gem 'simplecov'
end

group :test do
  gem 'rails-controller-testing'
  gem 'guard-rspec'
end

group :production do
  gem 'pg', '~> 1.5'
end

# Required for timezone support on Linux (Gradescope)
gem 'tzinfo-data'
gem 'puma'