class LogsController < ApplicationController
  def index
    render locals: { logs: logs }
  end

  def new
    log.prepopulate_data_from_workout
    render locals: { log: log }
  end

  def create
    save_log!
    redirect_to logs_url
  rescue ActiveRecord::RecordInvalid => e
    render :new, locals: { log: e.record }
  end

  def edit
    render locals: { log: log }
  end

  def update
    save_log!
    redirect_to logs_url
  rescue ActiveRecord::RecordInvalid => e
    render :edit, locals: { log: e.record }
  end

  private

  def logs
    @logs ||= log_scope.all
  end

  def log
    @log ||= if params[:id].present?
      log_scope.find(params[:id])
    else
      log_scope.new_from_wod(wod)
    end
  end

  def save_log!
    log.attributes = log_params
    log.save!
  end

  def log_scope
    current_user.logs
  end

  def wod
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
