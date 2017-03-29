set :application, 'summits'
set :repo_url, 'git@github.com:gkrathwohl/summits.git'

set :deploy_to, '/home/gkrathwohl/summits'
set :default_env, { path: "/home/gkrathwohl/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :linked_files, %w{config/database.yml}
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


namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export, :roles => :app do
    run "cd /var/summits && sudo bundle exec foreman export upstart /etc/init -a summits -l /var/my-ossum-app/log"
  end
  
  desc "Start the application services"
  task :start, :roles => :app do
    sudo "start my-ossum-app"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "stop my-ossum-app"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    run "sudo start my-ossum-app || sudo restart my-ossum-app"
  end
end

after "deploy:update", "foreman:export"
after "deploy:update", "foreman:restart"