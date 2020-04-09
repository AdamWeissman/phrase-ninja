class Situation < ApplicationRecord
  belongs_to :user

  has_many :phrases, dependent: :destroy
  has_many :scores, through: :phrases

  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :name, uniqueness: true

  def whip_up_some_phrases
    if self.text_blob_for_phrases.present?
      x = self.user_id #x is just a test name for the user_id, should rename this later
      @phrase_parser = PhraseParser.new(text_blob_for_phrases, id, x)
      @phrase_parser.phrases_for_situations
    end
  end


  #def get_index(situations)
  #  situations.each do |situation|
  #    sitch_phrases = situation.phrases.all
  #    sitch_phrases.each do |phrase|
  #      #binding.pry
  #      phrase.familiarity_score = phrase.score.familiarity_name_corresponding_points
  #      phrase.save
  #    end
  #  situation.save
  #end

end
