require_relative 'boot'

require 'google/cloud/translate'
require "romaji"
require "romaji/core_ext/string"

require 'rails/all'

def translate(something)
  translate = Google::Cloud::Translate.new version: :v2
  the_translation = translate.translate something, to: "ja"
  the_translation.text
end

def romanize(something, the_how = "romaji")
  romanized = something.the_how
  romanized
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
