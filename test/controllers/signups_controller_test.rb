require 'test_helper'

class SignupsControllerTest < ActionController::TestCase
  def test_new
    get :new

    assert_response :success
    assert_template :new
  end

  def test_create
    assert_difference 'User.count' do
      post :create, user: { email: generate(:email), password: generate(:password) }
    end
    assert_redirected_to root_path
  end
end
