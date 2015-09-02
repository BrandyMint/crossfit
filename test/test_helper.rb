ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'

FactoryGirl.reload
FactoryGirlSequences.reload

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  def user
    @user ||= create(:user, password: 'secret')
  end
end
