class StaticPagesController < ApplicationController
  def home
    @books = Book.limit(Settings.paginate_home_page).ordered
  end
end
