source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.12'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'mongoid', '~> 6.1.0'
gem 'jbuilder'
gem 'knock'
gem 'bcrypt'

group :development, :test do
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  gem 'mongoid-rspec'
  gem 'faker'
  gem 'dotenv-rails', groups: [:development, :test]
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
