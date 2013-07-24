source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'nav_lynx'
end

gem 'jquery-rails'

###########################
# Custom Gems for Project #
###########################

gem 'aasm'					# => State Machine for relationships
gem 'indeed', '0.1.2'				# => Indeed API for jobs
gem 'will_paginate'	# => Pagination for search results
gem 'font-awesome-rails' # => gem to get awesome font icons working
gem 'jquery-ui-rails'
gem 'cancan' # => authorization


group :development do
  gem 'webrick', '~> 1.3.1' # => Prevents warning display when running rails s.
  gem 'better_errors'       # => gem to display errors better for debugging
  gem 'binding_of_caller'   # => works with better_errors to show instance variables
  gem 'pry-debugger'        # => debugger for project.
  gem 'quiet_assets'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
