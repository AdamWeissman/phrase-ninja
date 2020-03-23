class User < ApplicationRecord
  has_many :situations
  has_many :emotions, through: :situations

  has_secure_password

  validates :name, :email, :beta_key, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      #user.name = auth.info.name
      user.email = auth.info.email
    end
  end

end
