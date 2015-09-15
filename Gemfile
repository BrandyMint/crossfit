source 'https://rubygems.org'

def darwin?
  RbConfig::CONFIG['host_os'] =~ /darwin/
end

def windows_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /mingw|mswin/i ? require_as : false
end

def linux_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /linux/ ? require_as : false
end
# Mac OS X
def darwin_only(require_as)
  RbConfig::CONFIG['host_os'] =~ /darwin/ ? require_as : false
end


gem 'rails', '4.2.4'

# gem 'friendly_id'
gem 'validates'
gem 'enumerize'
gem 'active_link_to'
gem 'sprockets-derailleur'
gem 'gravatarify'
gem 'paranoid2'
gem 'gon'
gem 'phone', github: 'BrandyMint/phone', branch: 'feature/russia'
gem 'chartkick'
gem 'globalid'
# Use Unicorn as the app server
gem 'unicorn'
gem 'bootstrap-sass', '~> 3.3'
gem 'font-awesome-rails'
gem 'bugsnag', '~> 2.8'
gem 'cocoon', '~> 1.2.6'
gem 'coffee-rails', '~> 4.1.0'
gem 'dotenv-rails', '~> 2.0'
gem 'jquery-rails'
gem 'nprogress-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'ranked-model', github: 'mixonic/ranked-model'
gem 'settingslogic'
gem 'pg', '~> 0.18'
gem 'russian', '~> 0.6.0'
gem 'sass-rails', '~> 5.0'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'jquery-ui-rails'

gem 'iframely'
gem 'reform', github: 'apotonick/reform'
gem 'mimemagic'

gem 'omniauth'
gem 'omniauth-vkontakte'
# gem 'foreigner', github: 'matthuhiggins/foreigner'

gem 'simple-navigation', git: 'git://github.com/andi/simple-navigation.git'
gem 'simple-navigation-bootstrap'
gem 'simple_form', '~> 3.1'
gem 'slim', '~> 3.0'
gem 'sorcery', '~> 0.9.1'
gem 'uglifier', '>= 1.3.0'
gem 'smsc'
gem 'authority'

gem 'draper'

gem 'virtus'
# nullify nillify
gem 'strip_attributes'
gem 'unit'

gem 'activeadmin', github: 'activeadmin'
# gem 'activeadmin'
gem 'inherited_resources'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'semver2'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
end

group :development, :test do
  # gem 'awesome_pry'
  gem 'pry-nav', github: 'pierosa/pry-nav'
  gem 'factory_girl_rails'
  gem 'factory_girl_sequences'
  gem 'spring'
  gem 'terminal-notifier-guard', '~> 1.6.1',  require: darwin_only('terminal-notifier-guard')

  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-minitest'
  # gem 'guard-rspec'
  gem 'guard-rails'
  # gem 'guard-shell'
  gem 'guard-ctags-bundler'
  gem 'guard-rubocop'

end

group :deploy do
  gem 'capistrano-shell'
  gem 'capistrano', '~> 3.2.1', :require => false
  gem 'capistrano-rbenv', '~> 2.0', :require => false
  gem 'capistrano-rails', '~> 1.1', :require => false
  gem 'capistrano-bundler', :require => false
  gem "capistrano-db-tasks", :require => false
end
