class Phrase < ApplicationRecord
  belongs_to :situation
  belongs_to :score
  belongs_to :user

  def translate
    if english.present?
      translator = Translator.new(english)

      self.japanese = translator.translated_text
      self.japanese_phonetic = translator.phonetic_text
      self.english_equivalent = translator.english_equivalent_text

      save
    end
  end

end
