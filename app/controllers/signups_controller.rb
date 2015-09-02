class SignupsController < ApplicationController
  skip_before_filter :require_login

  def new
    build_user
  end

  def create
    build_user
    save_user or render :new
  end

  private

  def build_user
    @user ||= user_scope.new
    @user.attributes = user_params
  end

  def save_user
    if @user.save
      redirect_to root_url
    end
  end

  def user_scope
    User.all
  end

  def user_params
    if params[:user].present?
      params.require(:user).permit(:email, :password)
    else
      {}
    end
  end
end
