class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :by_book, -> (book_id, user_id){where(book_id: book_id, user_id: user_id)}
  scope :by_mark, -> (user_id, type){where(user_id: user_id, "#{type}": true)}
  def self.case_params user_id, type
    case type
      when "read"
        user_books = UserBook.by_mark(user_id, "read")
      when "reading"
        user_books = UserBook.by_mark(user_id, "reading")
      when "favorite"
        user_books = UserBook.by_mark(user_id, "favorite")
    end
  end
end
