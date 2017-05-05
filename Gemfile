source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'coveralls', '0.8.19 ',require: false
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'devise'
gem 'bootstrap-sass'
gem 'haml'
gem 'activeadmin', github: 'activeadmin'
gem 'has_scope'
gem 'responders'
gem 'phashion'
gem 'unicorn'
gem 'sidekiq'
gem 'redis-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'better_errors'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_layout'
  gem 'binding_of_caller'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov', require: false
  gem 'webmock'
  gem 'selenium-webdriver', '3.3.0'
  gem 'chromedriver-helper'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

group :production do
  gem 'rails_12factor'
end
