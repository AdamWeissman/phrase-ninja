class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases, dependent: :destroy
  has_many :scores, through: :phrases

  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :name, uniqueness: true

  def whip_up_some_phrases
    if self.text_blob_for_phrases.present?
      x = self.user_id
      @phrase_parser = PhraseParser.new(text_blob_for_phrases, id, x)
      @phrase_parser.phrases_for_situations
    end
  end

end
