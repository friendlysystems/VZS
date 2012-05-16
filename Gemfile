source 'https://rubygems.org'

gem 'rails', '3.2.0'
gem 'rails-i18n', '~> 0.6.3'
gem 'sqlite3', '~> 1.3.6'
gem 'json', '~> 1.6.6'
gem 'jquery-rails', '~> 2.0.2'
gem 'authlogic', '~> 3.1.0'
gem 'cancan', '~> 1.6.7'
gem 'formtastic', '~> 2.1.0'
gem 'twitter-bootstrap-rails', '~> 2.0.4'
gem 'less', '~> 2.0.9'
gem 'will_paginate', '~> 3.0.3'
#gem 'validation_reflection'
gem 'paperclip', '~> 2.0'

gem 'wirble', :group => :development
gem 'quiet_assets', :group => :development
gem 'nifty-generators', '~> 0.4.6', :group => :development

gem "mocha", :group => :test

group :development, :test do
  gem "rspec-rails", "~> 2.8"
  gem "syntax"
  gem "ruby-debug", :platforms => :mri_18
  gem "guard"
  gem "guard-rspec"
  gem "factory_girl_rails", "~> 1.2"
  gem "timecop"
  gem "shoulda"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

# Deploy with Capistrano
group :deploy do
 gem 'capistrano'
 gem 'capistrano-ext'
 gem 'rvm-capistrano'
end

