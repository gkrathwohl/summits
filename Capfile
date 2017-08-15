# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'

require 'capistrano/passenger'

set :rbenv_type, :user
set :rbenv_ruby, '2.4.0'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
