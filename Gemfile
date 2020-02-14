#############################
# CORE BASE
#############################
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'rails', '~> 6.0.2.1'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 3.11'
gem 'webpacker', '~> 4.0'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'config'
gem 'dotenv-rails'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

#############################
# AUTHENTICATION, SECURITY
#############################
gem 'devise', git: 'https://github.com/plataformatec/devise.git'
gem 'pundit'

#############################
# TEMPLATE/VIEW ENGINES
#############################
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5'
gem 'slim-rails', '~> 3.2'

# gem 'font-awesome-rails'
# gem 'jquery-rails'
# gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'

#############################
# ENGINES
#############################
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'kaminari'
gem 'image_processing'
# gem 'mini_magick'

#############################
# API
#############################
# gem 'jbuilder', '~> 2.7'

#############################
# DEVELOPMENT
#############################
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug', '~> 3.7'

  gem 'rubocop', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
