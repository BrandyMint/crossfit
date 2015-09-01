class LogsController < ApplicationController
  def index
    load_logs
  end

  def new
    load_wod
    build_log
    @log.prepopulate_data_from_workout
  end

  def create
    load_wod
    build_log
    save_log or render :new
  end

  def edit
    load_log
  end

  def update
    load_log
    build_log
    save_log or render :edit
  end

  private

  def load_logs
    @logs ||= log_scope.all
  end

  def load_log
    @log ||= log_scope.find(params[:id])
  end

  def build_log
    @log ||= log_scope.new_from_wod(@wod)
    @log.attributes = log_params
  end

  def save_log
    if @log.save
      redirect_to logs_url
    end
  end

  def log_scope
    current_user.logs
  end

  def load_wod
    @wod ||= wod_scope.find(params[:wod])
  end

  def wod_scope
    Wod.all
  end

  def log_params
    if params[:log].present?
      move_logs_fields = %w(id move_id reps weight_kilos distance_meters height_meters time_seconds)
      params.require(:log).permit(:date, :notes, move_logs_attributes: move_logs_fields)
    else
      {}
    end
  end
end
