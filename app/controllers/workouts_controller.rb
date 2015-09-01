class WorkoutsController < ApplicationController
  def index
    load_workouts
  end

  def new
    build_workout
  end

  def create
    build_workout
    save_workout or render :new
  end

  def show
    load_workout
  end

  def edit
    load_workout
  end

  def update
    load_workout
    build_workout
    save_workout or render :edit
  end

  private

  def load_workouts
    @workouts ||= workout_scope.all
  end

  def load_workout
    @workout ||= workout_scope.find(params[:id])
  end

  def build_workout
    @workout ||= workout_scope.new
    @workout.attributes = workout_params
  end

  def save_workout
    if @workout.save
      redirect_to @workout
    end
  end

  def workout_scope
    Workout.all
  end

  def workout_params
    if params[:workout].present?
      moves_fields = %w(id exercise_id reps weight_kilos distance_meters height_meters time_seconds)
      params.require(:workout).permit :title,
                                      :description,
                                      :pre_workout,
                                      :special_pre_workout,
                                      :post_workout,
                                      moves_attributes: moves_fields
    else
      {}
    end
  end
end
