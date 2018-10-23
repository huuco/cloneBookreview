class UsersController < ApplicationController
  before_action :load_user, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "flash.check_mail"
      redirect_to user
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    @user_follower = @user.followers.ordered.page(params[:page])
      .per Settings.paginate_page
    @user_following = @user.following.ordered.page(params[:page])
      .per Settings.paginate_page
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.update_success"
      redirect_to @user
    else
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit User::ATTRIBUTE
  end

  def load_user
    @user = User.find_by id: params[:id]
    render html: t("flash.not_found") if @user.nil?
  end
end
