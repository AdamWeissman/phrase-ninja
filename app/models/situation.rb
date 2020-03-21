class Situation < ApplicationRecord
  belongs_to :user

  has_many :emotions
  has_many :phrases, through: :emotions

end
