class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def verify_admin
    return if is_admin? && logged_in?
    flash[:danger] = t "flash.permission"
    redirect_to root_url
  end

  def verify_login
    return if logged_in?
    flash[:danger] = t "flash.please_login"
    redirect_to login_url
  end
end
