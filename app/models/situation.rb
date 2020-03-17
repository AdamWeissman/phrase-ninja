class Situation < ApplicationRecord
  belongs_to :user
  belongs_to :language

  has_many :emotions
  has_many :phrases, through: :emotions

end
