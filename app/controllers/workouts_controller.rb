class WorkoutsController < ApplicationController
  def index
    render locals: { workouts: workouts }
  end

  def new
    render locals: { workout: workout }
  end

  def create
    save_workout!
    redirect_to workouts_url
  rescue ActiveRecord::RecordInvalid => e
    render :new, locals: { workout: e.record }
  end

  def show
    render locals: { workout: workout }
  end

  def edit
    render locals: { workout: workout }
  end

  def update
    save_workout!
    redirect_to workouts_url
  rescue ActiveRecord::RecordInvalid => e
    render :edit, locals: { workout: e.record }
  end

  private

  def workouts
    @workouts ||= workout_scope.all
  end

  def workout
    @workout ||= if params[:id].present?
      workout_scope.find(params[:id])
    else
      workout_scope.new
    end
  end

  def save_workout!
    workout.attributes = workout_params
    workout.save!
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
