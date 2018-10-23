class UserBooksController < ApplicationController
  before_action :load_user_book, only: %i(create update)

  def new

  end

  def create
    @user_book = current_user.user_books.build user_book_params
    @user_book.book_id = params[:book_id]
    if @user_book.save
      flash[:success] = t "flash.update_success"
    else
      flash[:danger] = t "flash.update_fail"
    end
  end

  def update
    if @user_book.update_attributes user_book_params
      flash[:success] = t "flash.update_success"
    else
      flash[:danger] = t "flash.update_fail"
    end
  end

  private

  def user_book_params
    params.require(:user_book).permit :read, :reading, :favorite
  end

  def load_user_book
    @user_book = UserBook.by_book(params[:book_id], current_user.id).first
    render html: t(".flash.not_found") if @user_book.nil?
  end
end
