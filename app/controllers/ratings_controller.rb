class RatingsController < ApplicationController
  before_action :verify_login
  before_action :load_book, only: %i(create edit update)
  before_action :load_rating, only: %i(eidt update)

  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.build rating_params
    @rating.book_id = params[:book_id]
    if @rating.save
      flash[:success] = t "flash.save_success"
      redirect_to @book
    else
      render :new
    end
  end

  def edit; end

  def update
    @rating.update_attributes rating_params
    if @rating.save
      flash[:success] = t "flash.update_success"
      redirect_to @book
    else
      flash[:danger] = t "flash.update_fail"
      render :edit
    end
  end

  private

  def rating_params
    params.require(:rating).permit :point, :content, :title
  end

  def load_rating
    @rating = Rating.find_by id: params[:id]
    render html: t(".not_found") if @rating.nil?
  end

  def load_book
    @book = Book.find_by id: params[:book_id]
    render html: t(".not_found") if @book.nil?
  end
end
