class WodsController < ApplicationController
  def index
    render locals: { wods: wods }
  end

  def new
    render locals: { wod: wod }
  end

  def create
    save_wod!
    redirect_to wods_url
  rescue ActiveRecord::RecordInvalid => e
    render :new, locals: { wod: e.record }
  end

  def edit
    render locals: { wod: wod }
  end

  def update
    save_wod!
    redirect_to wods_url
  rescue ActiveRecord::RecordInvalid => e
    render :edit, locals: { wod: e.record }
  end

  private

  def wods
    @wods ||= wod_scope.chrono
  end

  def wod
    @wod ||= if params[:id].present?
      wod_scope.find(params[:id])
    else
      wod_scope.new
    end
  end

  def save_wod!
    wod.attributes = wod_params
    wod.save!
  end

  def wod_scope
    Wod.all
  end

  def wod_params
    if params[:wod].present?
      params.require(:wod).permit(:date, :workout_id)
    else
      {}
    end
  end
end
