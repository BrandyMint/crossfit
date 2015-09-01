class ExercisesController < ApplicationController
  def index
    load_exercises
  end

  def new
    build_exercise
  end

  def create
    build_exercise
    save_exercise or render :new
  end

  def edit
    load_exercise
  end

  def update
    load_exercise
    build_exercise
    save_exercise or render :edit
  end

  private

  def load_exercises
    @exercises ||= exercise_scope.all
  end

  def load_exercise
    @exercise ||= exercise_scope.find(params[:id])
  end

  def build_exercise
    @exercise ||= exercise_scope.new
    @exercise.attributes = exercise_params
  end

  def save_exercise
    if @exercise.save
      redirect_to exercises_url
    end
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
