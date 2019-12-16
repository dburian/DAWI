class Admin::ApplicationController < ApplicationController
  include Admin::SessionsHelper

  def require_login
    unless logged_in?
      redirect_to admin_root_path
    end
  end
end
