class DashboardController < ApplicationController
  def show
    set_date
    load_todays_wod
  end

  private

  def set_date
    @date = if params[:date].present? && date = Date.parse(params[:date])
      date
    else
     Date.current
   end
  end

  def load_todays_wod
    @wod ||= wod_scope.find_wod_for_date(@date)
  end

  def wod_scope
    Wod.all
  end
end
