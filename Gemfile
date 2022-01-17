require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
gem 'rails', '5.2.4.6'

group :assets do
  gem 'coffee-rails', '~> 4.2.2'
  gem 'uglifier', '>= 2.7.2'
end

gem 'jquery-rails', '>= 4.4.0'
gem "haml", ">= 5.0.0"
gem "haml-rails", ">= 1.0.0"
gem "devise", ">= 4.7.1"
gem 'cancan'
gem "inherited_resources", ">= 1.6.0"
gem "simple_form", ">= 5.0.0"
gem "email_spec", ">= 1.4.0", group: :test
gem "sass-rails", "= 5.0.5"
gem 'compass_twitter_bootstrap', "2.0.3"
gem "compass-rails", "1.0.3" #, "~> 1.0.0"#, group: [:assets]

group :development do
  gem 'sqlite3'
  gem 'libnotify', '>= 0.8.0'
  gem 'rb-inotify', '>= 0.9.0'
  gem 'guard', '>= 1.8.0'
  gem 'guard-cucumber', '>= 1.4.0'
  # gem "guard-bundler", ">= 0.1.3"
  # gem "guard-rails", ">= 0.0.3"
  # gem "guard-livereload", ">= 0.3.0"
  # gem "guard-spork"
  # gem "guard-rspec", ">= 0.4.3"
end

group :development, :test do
  gem "mocha", require: false
  gem 'launchy', '>= 2.3.0'
  gem "database_cleaner"
  gem "rspec-rails", ">= 2.13.1"
  gem "factory_girl_rails", "~> 3.6", ">= 3.6.0"
  gem "capybara", ">= 2.1.0"
  gem "cucumber-rails", ">= 1.4.0", require: false
  gem 'zeus'

end


group :production do
  gem 'newrelic_rpm'
  gem 'pg'
end

gem "thin", ">= 1.5.1"
gem 'kaminari', '>= 1.2.1'
gem 'gravatar_image_tag'
gem "friendly_id", "~> 4.0.1"
gem 'acts_as_commentable_with_threading', '>= 1.2.0'
gem 'rest_in_place', '>= 2.1.1'

gem 'simplecov', require: false, group: :test