source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Base gems for app
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'

gem 'bootsnap', '>= 1.1.0', require: false

# Front end gems
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 4.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'pry', '~> 0.12.2'
  gem 'rspec-rails', '~> 3.8.1'
  gem 'rubocop', '~> 0.60.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'simplecov', '~> 0.16.1', require: false
  gem 'webmock', '~> 3.4.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
