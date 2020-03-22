class Phrase < ApplicationRecord
  belongs_to :situation
  belongs_to :phrase_score

  def translate
    if english.present?
      translator = Translator.new(english)

      self.japanese = translator.translated_text
      self.japanese_phonetic = translator.phonetic_text
      seff.english_equivalent = translator.english_equivalent_text

      save
    end
  end

  #for this to truly be useful, a user should be able to tag an additional EMOTION from a drop down menu
  #this will cause FLOATING phrases that are not attached to any given situation, so there should be a built-in situation
  #the built-in situation should always pre-populate before situations appear alphabetically.
  #the built-in situation would be "CROSS-EMOTIONAL" phrases that the user cannot directly edit.
end
