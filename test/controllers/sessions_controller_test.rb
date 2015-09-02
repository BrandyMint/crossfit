require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def test_new
    get :new

    assert_response :success
  end

  def test_create_wrong_credentials
    post :create, user: { email: 'not@here.com', password: 'wrongpass' }

    assert_response :success
  end

  def test_create_correct_credentials
    post :create, user: { email: user.email, password: 'secret' }

    assert_redirected_to root_path
  end

  def test_destroy
    login_user user
    delete :destroy

    assert_redirected_to login_path
    refute logged_in?
  end
end
