class User < ApplicationRecord
  has_many :situations
  has_many :scores
  has_many :phrases

  has_secure_password

  validates :name, :email, :beta_key, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}

  def self.from_omniauth(auth) #need to handle new users ... user first_or_create
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      #user.name = auth.info.name
      user.email = auth.info.email
    end
  end

  def brand_new_score(user) #use this with create and update
    @user = user
    grab_that_score = @user.scores.all.last
    @score_id = grab_that_score.id
    @score_id
  end

  def reset_all_scores
    @situations = self.situations.all
    @situations.each do |situation| #this should be a method on the situation model
      sitch_phrases = situation.phrases.all
      sitch_phrases.each do |phrase|
        #binding.pry
        phrase.familiarity_score = phrase.score.familiarity_name_corresponding_points
        phrase.save
      end
      situation.save
    end
  end





end
