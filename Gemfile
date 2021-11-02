source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://github.com/ged/ruby-pg)
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Tame Rails' multi-line logging into a single line per request (https://github.com/roidrage/lograge)
gem 'lograge'

# HiRedis
# gem 'hiredis', '~> 0.6.3'

# NamespaceRedis
# gem 'redis-namespace', '~> 1.8', '>= 1.8.1'
# Redis Rails
gem 'redis-rails', '~> 5.0', '>= 5.0.2'
# Store
gem 'redis-store', '~> 1.9'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# RestClient
gem 'rest-client', '~> 2.1'

group :development, :test do
  # Debug
  gem 'pry-byebug'

  # Rubocop-Rake
  gem 'rubocop-rake', '~> 0.6.0'

  # Rubocop
  gem 'rubocop-rails', '~> 2.12', '>= 2.12.4'

  # Rubocop
  gem 'rubocop-performance', '~> 1.11', '>= 1.11.5'

  # Automatic Ruby code style checking tool. (https://github.com/rubocop/rubocop)
  gem 'rubocop', require: false

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Automatic Minitest code style checking tool.
  gem 'rubocop-minitest', require: false
end

group :development do
  # Solargraph
  gem 'solargraph'

  # Listen
  gem 'listen', '~> 3.2'

  # Env
  gem 'dotenv-rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
