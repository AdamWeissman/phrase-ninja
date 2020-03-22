class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases
  has_many :phrase_scores, through: :phrases

  def testit
    @phrases_for_situations_test
  end

  def whip_up_some_phrases
    if text_blob_for_phrases.present?
      phrase_parser = PhraseParser.new(text_blob_for_phrases)
      uncategorized_phrases = phrase_parser.separate_the_content
      @phrases_for_situations_test = []
      uncategorized_phrases.each do |x|
        the_new_phrase = Phrase.create(english: x)
        the_new_phrase.save
        the_new_phrase.translate
        the_new_phrase.save
        @phrases_for_situations_test << the_new_phrase
      end
    end
  end

end
