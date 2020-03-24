class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases
  has_many :phrase_scores, through: :phrases

  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :name, uniqueness: true
  #commenting out the tests

  #def testit
  # @x
  #end

  def whip_up_some_phrases
    if self.text_blob_for_phrases.present?
      @phrase_parser = PhraseParser.new(text_blob_for_phrases)
      #binding.pry
      @phrase_parser.phrases_for_situations
    end
  end

end
