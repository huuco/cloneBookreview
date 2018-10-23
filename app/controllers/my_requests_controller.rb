class MyRequestsController < ApplicationController
  before_action :verify_login

  def index
    @requests = Request.by_user(current_user)
    .page(params[:page]).per Settings.paginate_page
  end
end
