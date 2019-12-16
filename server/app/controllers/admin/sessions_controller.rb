class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = Admin::Admin.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  private
    def session_params
      params.require(:admin_session).permit(
        :email,
        :password
      )
    end
end
