require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  def setup
    super
    login_user user
  end

  def test_index
    get :index

    assert_response :success
  end

  def test_new
    get :new, wod: create(:wod)

    assert_response :success
  end

  def test_create
    assert_difference 'Log.count' do
      post :create, wod: create(:wod), log: { date: generate(:date) }
    end
    assert_redirected_to logs_path
  end

  def test_edit
    log = create(:log, user: user)
    get :edit, id: log

    assert_response :success
  end

  def test_update
    log = create(:log, user: user)
    get :update, id: log, log: {}

    assert_redirected_to logs_path
  end
end
