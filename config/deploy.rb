set :application, 'summits'
set :repo_url, 'git@github.com:gkrathwohl/summits.git'

set :deploy_to, '/home/gkrathwohl/summits'

set :default_env, { path: "/home/gkrathwohl/.rbenv/shims:~/.rbenv/bin:$PATH" }

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# removed bin
# set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
