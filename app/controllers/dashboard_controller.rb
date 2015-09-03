class DashboardController < ApplicationController
  def show
    render locals: { date: current_date, wod: wod }
  end

  private

  def current_date
    @current_date ||= if params[:date].present? && date = Date.parse(params[:date])
      date
    else
     Date.current
   end
  end

  def wod
    @wod ||= wod_scope.find_wod_for_date(current_date)
  end

  def wod_scope
    Wod.all
  end
end
