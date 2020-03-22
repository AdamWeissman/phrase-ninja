class PhraseScore < ApplicationRecord
  has_many :phrases
  has_many :situations, through: :phrases
end
