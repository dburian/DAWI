module Admin::SessionsHelper
  def log_in admin
    session[:admin_id] = admin.id
  end
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin::Admin.find_by(id: session[:admin_id])
    end
  end
  def logged_in?
    !current_admin.nil?
  end
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
end
