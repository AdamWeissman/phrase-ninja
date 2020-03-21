import sys

from googletrans import Translator

translated_txt = sys.argv[1]

translator = Translator()

# translated_txt = translator.translate(input, dest='ja').text

# print(translated_txt)

transliterated_txt = translator.translate(translated_txt, dest='ja').pronunciation

print(transliterated_txt, end = '')
