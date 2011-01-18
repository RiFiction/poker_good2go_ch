require 'capistrano_colors'

set :server, :passenger

ssh_options[:forward_agent] = true
set :repository, "git@github.com:RiFiction/poker_good2go_ch.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :user, "deploy"  # The server's user for deploys
set :deploy_via, :remote_cache
set :deploy_to, '/srv/good2go.ch/poker/'
set :git_enable_submodules, 1
set :copy_exclude, [".git", "spec"]

set :application, "android"
set :use_sudo, false

#set :rvm_ruby_string, "1.9.2@rails3"
#set :rvm_type, :system

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "good2go"                          # Your HTTP server, Apache/etc
role :app, "good2go"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "good2go", :primary => true 

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

require "bundler/capistrano"
after "bundle:install", "deploy:migrate"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#set :default_environment, {
#  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p0@rails3:/usr/local/rvm/rubies/ruby-1.9.2-p0/bin:$PATH",
#  'RUBY_VERSION' => 'ruby 1.9.2',
#  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.2-p0',
#  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.2-p0@rails3',
#  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-1.9.2-p0/bin/bundle'
#}
