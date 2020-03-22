class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases
  has_many :phrase_scores, through: :phrases

  def whip_up_some_phrases
    if text_blob_for_phrases.present?
      phrase_parser = PhraseParser.new(text_blob_for_phrases)
      uncategorized_phrases = phrase_parser.separate_the_content
      uncategorized_phrase.each do |x|
        Phrase.new(english: x)
      end
    end
  end

end
