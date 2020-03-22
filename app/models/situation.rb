class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases
  has_many :phrase_scores, through: :phrases

end
