class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases
  has_many :phrase_scores, through: :phrases

  #commenting out the tests

  #def testit
  #  @x
  #end

  def whip_up_some_phrases
    if text_blob_for_phrases.present?
      phrase_parser = PhraseParser.new(text_blob_for_phrases)
      #@x = phrase_parser.phrases_for_situations
    end
  end

end
