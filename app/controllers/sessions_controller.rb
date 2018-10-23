class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        flash[:success] = t "flash.log_in_success"
        redirect_to user
      else
        flash[:danger] = t "flash.check_mail"
        redirect_to root_url
      end
    else
      flash[:warning] = t "flash.login_fail"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
    flash[:success] = t "flash.logout_success"
  end

end
