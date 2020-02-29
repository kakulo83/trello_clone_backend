# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'jwt', '~> 2.1'
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 4.0'
gem 'active_model_serializers', '~> 0.10'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors', require: 'rack/cors'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'acts_as_list'

group :development do
  gem 'annotate', '~> 2.7.4'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '4.0.0.rc1'
end

group :development, :test do
  gem 'pry-byebug', '~>3.6'
  gem 'pry-rails', '~> 0.3.8'
  gem 'factory_bot_rails'
  gem 'faker', '1.9.3'
  gem 'rspec-rails', '~> 3.8'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
