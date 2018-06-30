source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'rack-cors'

group :development, :test do
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'factory_bot_rails', '~> 4.10'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
