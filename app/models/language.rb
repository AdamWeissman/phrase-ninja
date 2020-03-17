class Language < ApplicationRecord
  belongs_to :user

  has_many :situations
  has_many :emotions, through: :situations
end
