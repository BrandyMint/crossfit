class SessionsController < ApplicationController
  skip_before_filter :require_login, except: %i(destroy)

  def new
  end

  def create
    if login(user_params[:email], user_params[:password])
      redirect_back_or_to root_url, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to login_url, notice: 'Logged out'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
