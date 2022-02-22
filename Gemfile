require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
gem 'rails', '5.2.6.2'

group :assets do
  gem 'coffee-rails', '~> 4.2.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '>= 4.0.1'
gem "haml", ">= 3.1.4"
gem "haml-rails", ">= 0.5.3"
gem "devise", ">= 4.4.2"
gem 'cancan'
gem "inherited_resources", ">= 1.6.0"
gem "simple_form", ">= 4.0.0"
gem "email_spec", ">= 1.2.1", group: :test
gem "sass-rails", "= 5.0.5"
gem 'compass_twitter_bootstrap', "2.0.3"
gem "compass-rails", "1.0.3" #, "~> 1.0.0"#, group: [:assets]

group :development do
  gem 'sqlite3'
  gem 'libnotify'
  gem 'rb-inotify'
  gem 'guard'
  gem 'guard-cucumber'
  # gem "guard-bundler", ">= 0.1.3"
  # gem "guard-rails", ">= 0.0.3"
  # gem "guard-livereload", ">= 0.3.0"
  # gem "guard-spork"
  # gem "guard-rspec", ">= 0.4.3"
end

group :development, :test do
  gem "mocha", require: false
  gem 'launchy', '>= 2.1.0'
  gem "database_cleaner"
  gem "rspec-rails", ">= 2.13.1"
  gem "factory_girl_rails", "~> 3.6", ">= 3.6.0"
  gem "capybara"
  gem "cucumber-rails", ">= 1.4.0", require: false
  gem 'zeus'

end


group :production do
  gem 'newrelic_rpm'
  gem 'pg'
end

gem "thin"
gem 'kaminari', '>= 0.14.1'
gem 'gravatar_image_tag'
gem "friendly_id", "~> 4.0.1"
gem 'acts_as_commentable_with_threading'
gem 'rest_in_place', '>= 2.1.1'

gem 'simplecov', require: false, group: :test