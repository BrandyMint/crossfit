set :application, 'workoutyear.icfdev.ru'
set :stage, :production
set :repo_url, 'git@github.com:BrandyMint/crossfit.git'
#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_to, ->{"/home/wwwworkoutyear/#{fetch(:application)}"}
server '188.40.121.12', user: 'wwwworkoutyear', port: 249, roles: %w{web app db}
set :rails_env, :production
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :production)
