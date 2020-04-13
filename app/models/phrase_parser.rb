class PhraseParser #should this also go into models/concerns?

  attr_accessor :text_blob, :the_situation_id, :user_id

  def initialize(text_blob_for_phrases, id, user_id)
    self.text_blob = text_blob_for_phrases
    self.the_situation_id = id
    self.user_id = user_id
  end

  def separate_the_content
    text_blob.split("\n")
  end

  def line_splitter(line)
    line.split(":")
  end

  def phrases_for_situations
    @this_one_user = User.find(user_id)
    uncategorized_phrases = separate_the_content
    uncategorized_phrases.each do |line|
      if line.count(":") == 1
        the_split = line_splitter(line)
        the_category = the_split[0].strip
        the_phrase = the_split[1].strip
        the_new_phrase = Phrase.new(category: the_category, english: the_phrase, situation_id: the_situation_id, score_id: @this_one_user.scores.last.id) #need to interpolate the users actual score
        the_new_phrase.save
        #binding.pry
        the_new_phrase.translate
        the_new_phrase.save
      else
        next
      end
    end

  end

end
