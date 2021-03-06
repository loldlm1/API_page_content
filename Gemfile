source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Default gems
gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'redcarpet'
gem 'rouge'
gem 'github-css-rails', '~> 1.1.3'
# HTML parser
gem 'nokogiri', '~> 1.8', '>= 1.8.2'
# HTTP and REST client for Ruby
gem 'rest-client', '~> 2.0', '>= 2.0.2'
# Allows cross-origin request
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.7.1'
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'puffing-billy'
  gem 'thin'
  gem 'webmock'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
