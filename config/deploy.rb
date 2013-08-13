require 'bundler/capistrano' # for bundler support

set :application, "HireCRM"
set :repository,  "git@github.com:flatiron-school/hire-redux.git"

set :user, 'acdc'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true

role :web, "192.241.176.112"                          # Your HTTP server, Apache/etc
role :app, "192.241.176.112"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :deploy do
  # Ask whether to reindex before restarting Passenger
  task :restart, :roles => :app, :except => {:no_release => true} do
    solr.reindex if 'y' == Capistrano::CLI.ui.ask("\n\n Should I reindex all models? (anything but y will cancel)")
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
 
  desc 'create shared data and pid dirs for Solr'
  task :setup_solr_shared_dirs do
    # conf dir is not shared as different versions need different configs
    %w(data pids).each do |path|
      run "mkdir -p #{shared_path}/solr/#{path}"    
    end
  end
 
  desc 'substitutes current_path/solr/data and pids with symlinks to the shared dirs'
  task :link_to_solr_shared_dirs do
    %w(solr/data solr/pids).each do |solr_path|
      run "rm -fr #{current_path}/#{solr_path}" #removing might not be necessary with proper .gitignore setup
      run "ln -s #{shared_path}/#{solr_path} #{current_path}/#{solr_path}"
    end
  end
end
 
after 'deploy:setup', 'deploy:setup_solr_shared_dirs'
# rm and symlinks every time we finished uploading code and symlinking to the new release
after 'deploy:update', 'deploy:link_to_solr_shared_dirs'
 
 
# Tasks to interact with Solr and SunSpot
namespace :solr do
  desc "start solr"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:start"
  end
  desc "stop solr"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:stop"
  end
 
  desc "stop solr, remove data, start solr, reindex all records"
  task :hard_reindex, :roles => :app do
    stop
    run "rm -rf #{shared_path}/solr/data/*"
    start
    reindex
  end
 
 
  desc "simple reindex" #note the yes | reindex to avoid the nil.chomp error
  task :reindex, roles: :app do
    run "cd #{current_path} && yes | RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:reindex"
  end
end