require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  def setup
    super
    login_user user
  end

  def test_show
    get :show

    assert_response :success
    assert_template :show
  end
end
