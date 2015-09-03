class ExercisesController < ApplicationController
  def index
    render locals: { exercises: exercises }
  end

  def new
    render locals: { exercise: exercise }
  end

  def create
    save_exercise!
    redirect_to exercises_url
  rescue ActiveRecord::RecordInvalid => e
    render :new, locals: { exercise: e.record }
  end

  def edit
    render locals: { exercise: exercise }
  end

  def update
    save_exercise!
    redirect_to exercises_url
  rescue ActiveRecord::RecordInvalid => e
    render :edit, locals: { exercise: e.record }
  end

  private

  def exercises
    @exercises ||= exercise_scope.all
  end

  def exercise
    @exercise ||= if params[:id].present?
      exercise_scope.find(params[:id])
    else
      exercise_scope.new
    end
  end

  def save_exercise!
    exercise.attributes = exercise_params
    exercise.save!
  end

  def exercise_scope
    Exercise.all
  end

  def exercise_params
    if params[:exercise].present?
      params.require(:exercise).permit(:title, :description)
    else
      {}
    end
  end
end
