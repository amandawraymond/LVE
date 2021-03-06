class User < ActiveRecord::Base
  has_many :artists, dependent: :destroy
  has_many :concerts, dependent: :destroy
  
  before_save { email.downcase! }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6, maximum:50 }

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def self.digest(token)
    Digest::MD5.hexdigest(token.to_s)
  end

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
