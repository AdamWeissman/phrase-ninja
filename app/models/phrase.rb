class Phrase < ApplicationRecord
  belongs_to :situation
  belongs_to :score
  belongs_to :user

  #  [ "I totally know this.", 89.0],
  #  [ "It's familiar.", 55.0],
  #  [ "I feel optimistic.", 34.0],
  #  [ "I feel pessimistic.", 21.0],
  #  [ "It's unfamiliar.", 13.0],
  #  [ "I don't know this at all.", 8.0]

  def self.i_dont_know_this_at_all
    where(:familiarity_score => 8.0)
  end

  def self.unfamiliar
    where(:familiarity_score => 13.0)
  end

  def self.pessimistic
    where(:familiarity_score => 21.0)
  end

  def self.optimistic
    where(:familiarity_score => 34.0)
  end

  def self.familiar
    where(:familiarity_score => 34.0)
  end

  def self.optimistic
    where(:familiarity_score => 34.0)
  end

  def self.i_totally_know_this
    where(:familiarity_score => 89.0)
  end



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
