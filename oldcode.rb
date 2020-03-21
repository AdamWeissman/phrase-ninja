=begin
require "romaji"
require "romaji/core_ext/string"
require "tiny_segmenter"
require "tataki"

def translate(something)
  @translator = Google::Cloud::Translate.new version: :v2
  the_translation = @translator.translate something, to: "ja"
  the_translation.text
end

def translate_back(something)
  the_translation = @translator.translate something, to: "en"
  the_translation.text
end

def crazy_translate(something)
  ts = TinySegmenter.new
  google_translation = translate(something)
  #x = x.to_kana
  tiny_segmented_translation_with_kanji = ts.segment(google_translation)
  romaji = tiny_segmented_translation_with_kanji.map {|s| s.romaji }.join(" ")
  romaji
end
=end


=begin
require "romaji"
Romaji.kana2romaji "スシ" #=> "sushi"
Romaji.romaji2kana "sushi" #=> "スシ"
Romaji.romaji2kana "sushi", :kana_type => :hiragana #=> "すし"

require "romaji/core_ext/string"
"sushi".kana #=> "スシ"
"スシ".romaji #=> "sushi"
a = "sushi"
a.kana!
p a #=> "スシ"
a.romaji!
p a #=> "sushi"

ts = TinySegmenter.new
ts.segment("今晩は！良い天気ですね。")# => ["今晩", "は", "！", "良い", "天気", "です", "ね", "。"]
ts.segment("今晩は！良い天気ですね。", ignore_punctuation: true)# => ["今晩", "は", "良い", "天気", "です", "ね"]
Input text should be UTF-8 encoded.


require "tataki"
"漢字をひらがなに変換".to_kana # => "かんじをひらがなにへんかん"
"X線研究者".to_kana # => "えっくすせんけんきゅうしゃ"
"肉を食べるだけの簡単なお仕事".to_kana # => "にくをたべるだけのかんたんなおしごと"

require "tataki/base"

alphabet_converter = Tataki::Converter::Alphabet.new
alphabet_converter.to_kana("abcde") # => "えーびーしーでぃーいー"

skk_converter = Tataki::Converter::SkkJisyo.new
skk_converter.to_kana("研究者") # => "けんきゅうしゃ"

alphabet_skk_converter = Tataki::Converter::Combine.new(Tataki::Converter::Alphabet.new, Tataki::Converter::SkkJisyo.new)
alphabet_skk_converter.to_kana("X線研究者") # => "robottotaisennf"
=end
