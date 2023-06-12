source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 7.0.5'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.2.2'
gem 'devise'
gem 'dotenv-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'omniauth'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-vkontakte'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', github: 'varvet/pundit'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'cucumber-rails', require: false
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'i18n-tasks', '~> 1.0.12'
  gem 'rspec-rails'
end

group :development do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'easy_translate'
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
end
