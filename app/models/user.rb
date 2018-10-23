class User < ApplicationRecord
  attr_accessor :activation_token
  before_save :downcase_email
  before_create :create_activation_digest
  has_many :likes
  has_many :ratings
  has_many :requests
  has_many :comments
  has_many :histories
  has_many :user_books
  has_many :active_relationships, class_name: Relationship.name,
   foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :avatar, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  validates :phone, presence: true, length: {maximum: Settings.maximum_phone}
  validates :name, presence: true
  ATTRIBUTE = %i(email name phone avatar password password_confirmation)
  scope :ordered, ->{order(name: :desc)}

  has_secure_password

  validates :password, length: {minimum: Settings.minnimum_password}

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest string
    cost = BCrypt::Engine.cost
    cost = BCrypt::Engine::MIN_COST if ActiveModel::SecurePassword.min_cost
    BCrypt::Password.create string, cost: cost
  end

  def authenticate? attribute, token
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def activate
    update_attributes activate: true
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
