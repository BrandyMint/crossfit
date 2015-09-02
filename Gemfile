source 'https://rubygems.org'

gem 'rails', '4.2.4'

gem 'bootstrap-sass', '~> 3.3'
gem 'bugsnag', '~> 2.8'
gem 'cocoon', '~> 1.2.6'
gem 'coffee-rails', '~> 4.1.0'
gem 'dotenv-rails', '~> 2.0'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'russian', '~> 0.6.0'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.1'
gem 'slim', '~> 3.0'
gem 'sorcery', '~> 0.9.1'
gem 'uglifier', '>= 1.3.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-minitest'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'awesome_pry'
  gem 'spring'
end

group :deploy do
  gem 'capistrano', '~> 3.2.1', :require => false
  gem 'capistrano-rbenv', '~> 2.0', :require => false
  gem 'capistrano-rails', '~> 1.1', :require => false
  gem 'capistrano-bundler', :require => false
  gem "capistrano-db-tasks", :require => false
end

group :test do
  gem 'factory_girl_rails'
  gem 'factory_girl_sequences'
  gem 'spring'
end
