class Admin::BooksController < ApplicationController
  before_action :verify_admin
  before_action :load_book, only: %i(show edit update destroy)

  def index
    books = Book.like_by_name_author params[:keyword]
    books = books.filter_by_category(params[:cate_id]) unless params[:cate_id].blank?
    respond_to do |format|
      format.js
      format.html {books = Book.ordered}
    end
    @books = books.ordered.page(params[:page])
      .per Settings.paginate_page
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "flash.save_success"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "flash.update_success"
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t "flash.destroy_success"
    else
      flash[:danger] = t "flash.destroy_fail"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit Book::ATTRIBUTE
  end

  def load_book
    @book = Book.find_by id: params[:id]
    render html: t("flash.not_found") if @book.nil?
  end
end
