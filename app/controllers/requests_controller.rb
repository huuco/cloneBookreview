class RequestsController < ApplicationController
  before_action :verify_login
  before_action :load_request, only: %i(show edit update destroy)

  def show; end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.build request_params

    if @request.save
      flash[:info] = t "flash.check_mail"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @request.update_attributes request_params
      flash[:success] = t "flash.update_succes"
      redirect_to @request
    else
      render :edit
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t "flash.destroy_succes"
    else
      flash[:danger] = t "flash.destroy_fail"
    end
    redirect_to myrequest_url
  end

  private

  def request_params
    params.require(:request).permit :book_name, :content
  end

  def load_request
    @request = Request.find_by id: params[:id]
    render html: t("flash.not_found") if @request.nil?
  end
end
