source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'

gem 'sqlite3'
gem 'pg', '~> 0.13'
gem 'heroku_backup_task', :git => 'git://github.com/mataki/heroku_backup_task.git'

gem 'devise', '~> 1.5'
gem 'omniauth', '~> 1.0'
gem 'omniauth-facebook', '~> 1.0'

gem 'newrelic_rpm'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'awesome_print'
end

group :test do
  gem 'rspec-rails', '~> 2.6'
  gem 'cucumber-rails', :require => false
  gem 'cucumber'
  gem 'ramaze' # cucumber has a dependency
  gem 'webrat' # cucumber has a dependency
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'headless'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'spork-rails'

  gem "simplecov", :require => false
  gem 'launchy' # So you can do Then show me the page
end
