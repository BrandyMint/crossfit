class WodsController < ApplicationController
  def index
    load_wods
  end

  def new
    build_wod
  end

  def create
    build_wod
    save_wod or render :new
  end

  def edit
    load_wod
    build_wod
  end

  def update
    load_wod
    build_wod
    save_wod or render :edit
  end

  private

  def load_wods
    @wods ||= wod_scope.chrono
  end

  def load_wod
    @wod ||= wod_scope.find(params[:id])
  end

  def build_wod
    @wod ||= wod_scope.new
    @wod.attributes = wod_params
  end

  def save_wod
    if @wod.save
      redirect_to wods_url
    end
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
