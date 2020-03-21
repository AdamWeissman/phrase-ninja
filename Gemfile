source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'



# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem "pry"

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

#gem 'omniauth'
gem 'dotenv-rails'
gem 'omniauth-google-oauth2'

#gem 'devise', '~> 4.2'

#This gem provides a mitigation against CVE-2015-9284 (Cross-Site Request Forgery on the request phase when using OmniAuth gem with a Ruby on Rails application) by implementing a CSRF token verifier that directly uses ActionController::RequestForgeryProtection code from Rails.
#gem "omniauth-rails_csrf_protection"

#Google Translate
gem 'google-cloud-translate', require: 'google/cloud/translate'
gem 'google-api-client'
gem 'google-cloud-storage'

#morphological text analyzer ... PLEASE WORK!!!!
gem 'romaji'
gem 'tiny_segmenter'
gem 'tataki'


# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  #gem 'capybara', '>= 2.15'

  #gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  #gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
