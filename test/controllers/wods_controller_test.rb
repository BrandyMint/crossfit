require 'test_helper'

class WodsControllerTest < ActionController::TestCase
  def setup
    super
    login_user user
  end

  def test_index
    get :index

    assert_response :success
    assert_template :index
  end

  def test_new
    get :new

    assert_response :success
    assert_template :new
  end

  def test_create
    workout = create(:workout)

    assert_difference 'Wod.count' do
      post :create, wod: { workout_id: workout, date: generate(:date) }
    end
    assert_redirected_to wods_path
  end

  def test_edit
    wod = create(:wod)
    get :edit, id: wod

    assert_response :success
    assert_template :edit
  end

  def test_update
    wod = create(:wod)
    get :update, id: wod, wod: {}

    assert_redirected_to wods_path
  end
end
