# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'soap_ws'
set :repo_url, 'git@github.com:pacuna/rails-wash_out-example.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deployer/web/soap_ws'
set :pty, true
set :format, :pretty
