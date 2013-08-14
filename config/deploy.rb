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

# Load assets here and create symlinks.
# after 'deploy:update_code','deploy:symlink_config'
after 'deploy:update_code','deploy:copy_themed_css'
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_config, :roles => :app do 
    run "ln -nfs #{shared_path}/application.yml #{current_release}/config/application.yml"
    run "ln -nfs #{shared_path}/production.sqlite3 #{current_release}/db/production.sqlite3"
  end

  task :copy_themed_css do
  	run "cp #{current_release}/vendor/assets/perfectum_dashboard_1_0_5/css/* #{current_release}/public"
  	run "cp #{current_release}/vendor/assets/perfectum_dashboard_1_0_5/css/* #{current_release}/public/assets"
  end
end