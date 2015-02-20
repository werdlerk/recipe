source 'https://rubygems.org'

ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Sprockets 2.11.3 somehow breaks jquery-ui css files
# " TypeError: 'null' is not an object (evaluating 'match[1]') "
# gem 'sprockets', '2.11.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Add Bootstrap magic
gem 'bootstrap-sass', '~> 3.3.0'
gem 'autoprefixer-rails'
gem 'font-awesome-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use JQuery UI
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# File uploading and processing
gem 'carrierwave'
gem 'mini_magick'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Heroku specific gem for platform features
gem 'rails_12factor'
# Heroku specific gem for logging
gem 'rails_stdout_logging'
# Heroku specific gem for having rails serve statis assets
gem 'rails_serve_static_assets'
# https://devcenter.heroku.com/articles/ruby-support#injected-plugins

# Puma webserver
# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
gem 'puma'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'pry'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
  gem 'mysql2'
end

