class User < ApplicationRecord
  has_many :languages
  has_many :situations, through: :languages
  has_many :emotions, through: :situations

  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

end
