class PhraseParser

  attr_accessor :text_blob

  def initialize(text_blob_for_phrases)
    self.text_blob = text_blob_for_phrases
  end

  def separate_the_content
    text_blob.split("\n")
  end

  def line_splitter(line)
    line.split(":")
  end

  #commenting out tests

  def phrases_for_situations
    uncategorized_phrases = separate_the_content
    #phrases_for_situations_test = []
    uncategorized_phrases.each do |line|
      if line.count(":") == 1
        the_split = line_splitter(line)
        the_category = the_split[0].strip
        the_phrase = the_split[1].strip
        the_new_phrase = Phrase.new(category: the_category, english: the_phrase)
        the_new_phrase.save
        the_new_phrase.translate
        the_new_phrase.save
        #phrases_for_situations_test << the_new_phrase
      else
        next
      end
    end
    #phrases_for_situations_test
  end

#this was a nightmare to setup, hours of testing on repl.it I hope it works here.

end
