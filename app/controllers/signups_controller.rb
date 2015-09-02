class SignupsController < ApplicationController
  skip_before_filter :require_login

  def new
    render locals: { user: user }
  end

  def create
    save_user!
    auto_login(user)
    redirect_to root_url
  rescue ActiveRecord::RecordInvalid => e
    render :new, locals: { user: e.record }
  end

  private

  def user
    @user ||= user_scope.new
  end

  def save_user!
    user.attributes = user_params
    user.save!
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
