class Admin::SessionsController < Admin::ApplicationController
  def new
    if logged_in?
      redirect_to admin_home_path
    end
  end

  def create
    admin = Admin::Admin.find_by(email: session_params[:email].downcase)
    logger.debug "Email: #{session_params[:email]}"
    logger.debug "Password: #{session_params[:password]}"

    if admin && admin.authenticate(session_params[:password])
      logger.debug "Admin: #{admin.name}"
      log_in admin
      flash.now[:success] = "User #{admin.name} logged in."
      redirect_to admin_home_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    flash.now[:success] = 'Logged out'
    redirect_to admin_root_path
  end
  private
    def session_params
      params.require(:admin_session).permit(
        :email,
        :password
      )
    end
end
