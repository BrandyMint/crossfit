require 'test_helper'

class ExercisesControllerTest < ActionController::TestCase
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
    assert_difference 'Exercise.count' do
      post :create, exercise: { title: generate(:string) }
    end
    assert_redirected_to exercises_path
  end

  def test_edit
    exercise = create(:exercise)
    get :edit, id: exercise

    assert_response :success
    assert_template :edit
  end

  def test_update
    exercise = create(:exercise)
    get :update, id: exercise, exercise: {}

    assert_redirected_to exercises_path
  end
end
