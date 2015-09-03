require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  def setup
    super
    login_user user
  end

  def test_access
    assert_access_denied_for_actions %i(index new create show edit update)
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
    assert_difference 'Workout.count' do
      post :create, workout: { title: generate(:string) }
    end
    assert_redirected_to workouts_path
  end

  def test_show
    workout = create(:workout)
    get :show, id: workout

    assert_response :success
    assert_template :show
  end

  def test_edit
    workout = create(:workout)
    get :edit, id: workout

    assert_response :success
    assert_template :edit
  end

  def test_update
    workout = create(:workout)
    get :update, id: workout, workout: {}

    assert_redirected_to workouts_path
  end
end
