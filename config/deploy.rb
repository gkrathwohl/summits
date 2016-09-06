set :application, 'summits'
set :repo_url, 'git@github.com:gkrathwohl/summits.git'

set :deploy_to, '/home/deploy/summits'

#set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# removed bin
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}


namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end