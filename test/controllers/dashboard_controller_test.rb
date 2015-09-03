require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  def setup
    super
    login_user user
  end

  def test_access
    assert_access_denied_for_actions %i(show)
  end

  def test_show
    get :show

    assert_response :success
    assert_template :show
  end
end
