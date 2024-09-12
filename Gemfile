source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 7.1'
gem 'bootsnap', require: false
gem 'breadcrumbs_on_rails'
gem 'caxlsx', '~> 4.0'
gem 'caxlsx_rails', '~> 0.6'
gem 'forticons'
gem 'forticons_helper'
gem 'image_processing'
gem 'importmap-rails'
gem 'pg', '1.5.8'
gem 'puma'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data'
gem "hcaptcha", "~> 7.1" # todo: migrate to friendlycaptcha

# windows specific
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# development
group :development do
  gem 'sqlite3'
  gem 'redis'
  gem 'web-console'
  gem 'hotwire-livereload'
  gem 'rubocop-rails-omakase', require: false
  gem 'capybara'
  gem 'selenium-webdriver' # todo: migrate to cuprite
end
