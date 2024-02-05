source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'rubocop-performance', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker'
end
