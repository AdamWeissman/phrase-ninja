require_relative 'boot'

require 'google/cloud/translate'
require 'rails/all'
require "romaji"
require "romaji/core_ext/string"
require "tiny_segmenter"
require "tataki"

def translate(something)
  translator = Google::Cloud::Translate.new version: :v2
  the_translation = translator.translate something, to: "ja"
  the_translation.text
end

def crazy_translate(something)
  ts = TinySegmenter.new
  x = translate(something)
  x = x.to_kana
  y = ts.segment(x)
  y
end


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




# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhraseNinja
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
