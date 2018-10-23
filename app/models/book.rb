class Book < ApplicationRecord
  has_many :ratings
  has_many :requests
  has_many :user_books
  belongs_to :category
  mount_uploader :image, ImageUploader
  validates :author, presence: true
  validates :image, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :number_of_pages, presence: true, numericality: {only_integer: true}
  validates :description, presence: true, length: {minimum: Settings.mini_description}
  ATTRIBUTE = %i(name image author description number_of_pages price category_id)

  scope :list_book, -> {select(:id, :name, :created_at, :author, :category_id).
    includes(:category).order(created_at: :asc)}

  scope :ordered, -> {order(created_at: :desc)}
  scope :like_by_name_author, (lambda do |key_word|
    select(:id, :name, :author).includes(:category)
      where("name LIKE :q OR author LIKE :q", q: "%#{key_word}")
  end)
  scope :filter_book, -> (key_word, category_id){select(:id, :name, :author,
   :category_id).includes(:category).where("(name like ? or author like ?)
    and category_id = ?", "%#{key_word}", "%#{key_word}", "%#{category_id}")
   .order(created_at: :desc)}
  scope :filter_by_category, -> (cate_id){includes(category).where(category_id: cate_id)}
  delegate :title, to: :category, prefix: true, allow_nil: true
  private

  def picture
    if picture.size > Settings.validate_size_image.megabytes
      errors.add :picture, t(".more_than")
    end
  end
end
