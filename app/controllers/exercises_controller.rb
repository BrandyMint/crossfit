class ExercisesController < ApplicationController
  def index
    render locals: { exercises: exercises }
  end

  def new
    render locals: { exercise: build_exercise }
  end

  def create
    build_exercise.save!
    redirect_to exercises_url
  rescue ActiveRecord::RecordInvalid => e
    render :new, locals: { exercise: e.record }
  end

  def edit
    render locals: { exercise: exercise }
  end

  def update
    exercise
    build_exercise.save!
    redirect_to exercises_url
  rescue ActiveRecord::RecordInvalid => e
    render :edit, locals: { exercise: e.record }
  end

  private

  def exercises
    @exercises ||= exercise_scope.all
  end

  def exercise
    @exercise ||= exercise_scope.find(params[:id])
  end

  def build_exercise
    @exercise ||= exercise_scope.new
    @exercise.attributes = exercise_params
    @exercise
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
