class Translator

  attr_accessor :english, :translated_text, :phonetic_text

  def initialize(english)
    self.english = english
    translate
    make_phonetic
  end

  def translate
    translator = Google::Cloud::Translate.new version: :v2

    the_translation = translator.translate english, to: "ja"

    self.translated_text = the_translation.text
  end

  def make_phonetic
    self.phonetic_text = `python3 vendor/google_pronounce.py '#{translated_text}'`
  end

end
