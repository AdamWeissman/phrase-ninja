class User < ApplicationRecord
  has_many :languages
  has_many :situations, through: :languages
  has_many :emotions, through: :situations
end
