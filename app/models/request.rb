class Request < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user
  ATTRIBUTE = %i(book_name user_id content status)
  enum status: {progress: 0, error: 1}
  scope :by_user, -> user_id {where user_id: user_id}
  scope :ordered, -> {order created_at: :desc}

  validates :book_name, presence: true
  validates :content, presence: true
  delegate :name, to: :book, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true
end
