class Phrasescore < ApplicationRecord
  belongs_to :user

  has_many :phrases
  has_many :situations, through: :phrases
end
