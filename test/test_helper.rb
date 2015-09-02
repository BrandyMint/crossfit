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

  def assert_access_denied_for_actions(actions = [])
    logout_user

    actions.each do |action|
      params = if %i(show edit update).include?(action)
        { id: 1 }
      else
        {}
      end
      get action, params
      assert_redirected_to login_path
    end
  end
end
