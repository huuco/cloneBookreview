class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticate?(:activation, params[:id])
      user.update_attributes activated: true
      flash[:success] = t "flash.account_success"
      redirect_to user
    else
      flash[:danger] = t "flash.invalid_link"
      redirect_to root_url
    end
  end
end

