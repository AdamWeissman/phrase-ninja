class Translator  #this should probabyl be in the library ... this could also be a gem

  attr_accessor :english, :english_equivalent_text, :translated_text, :phonetic_text

  def initialize(english)
    self.english = english
    translate
    make_phonetic
  end

  def translate
    translator = Google::Cloud::Translate.new version: :v2

    the_translation = translator.translate english, to: "ja" #this English refers to the attr_accessor variable set in initialize

    self.translated_text = the_translation.text

    reverse_translate = translator.translate the_translation.text, to: "en"

    self.english_equivalent_text = reverse_translate.text

  end

  def make_phonetic
    self.phonetic_text = `python3 vendor/google_pronounce.py '#{translated_text}'`
  end

end
