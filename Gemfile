source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'aasm', '~> 4.12', '>= 4.12.2'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'cancancan', '~> 2.0'
gem 'carrierwave', '~> 1.1'
gem 'coffee-rails', '~> 4.2'
gem 'country_select', '~> 3.1'
gem 'devise', '~> 4.3'
gem 'draper', '~> 3.0'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'fog-aws', '~> 1.4', '>= 1.4.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'mini_magick', '~> 4.8'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-facebook', '~> 4.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '5.1.2'
gem 'rails_admin', '1.3.0'
gem 'rails_admin_aasm', '~> 0.1.1'
gem 'rectify', '~> 0.10.0'
gem 'sass-rails', '~> 5.0'
gem 'seed_dump', '~> 3.2', '>= 3.2.4'
gem 'simple_form', '~> 3.5'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'wicked', '~> 1.3', '>= 1.3.2'

group :development, :test do
  gem 'factory_girl_rails', '~> 4.8'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'capybara-webkit', '~> 1.14'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'faker', '~> 1.8', '>= 1.8.4'
  gem 'rack_session_access', '~> 0.1.1'
  gem 'selenium-webdriver', '~> 3.5', '>= 3.5.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.4.1'
