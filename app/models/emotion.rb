class Emotion < ApplicationRecord
  belongs_to :situation
  belongs_to :phrase
end
