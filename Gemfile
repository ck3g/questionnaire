source 'https://rubygems.org'

gem 'rails', '4.0.0'

gem 'pg'
gem 'haml-rails'
gem 'anjlab-bootstrap-rails', '>= 2.3', require: 'bootstrap-rails'
gem 'font-awesome-rails'
gem 'meta-tags', require: 'meta_tags'
gem 'simple_form', '~> 3.0.0.rc'
gem 'devise', '>= 3.0.0'
gem 'cancan'

gem 'russian'
gem 'bitmask_attributes', github: 'jigfox/bitmask_attributes', branch: 'rails4'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer'
gem 'jquery-rails'
gem 'handlebars_assets'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


group :development do
  gem 'capistrano'
  gem 'capistrano-recipes'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn', '~> 0.1.10', require: false
  gem 'capistrano-rbenv', :require => false
  gem 'erb2haml'
  gem 'html2haml'
  gem 'rails_best_practices'
  gem 'thin'
  gem 'zeus'
  gem 'bullet'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end

group :test do
  gem 'ffaker'
  gem 'launchy'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'selenium-webdriver'
end

group :development, :production do
  gem "unicorn", '~> 4.6.3'
end
