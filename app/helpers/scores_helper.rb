module ScoresHelper

  def studying_switches_for_situations
    params.permit!
    params[:user][:situations].each do |s|
      situation = Situation.find(s[:id])
      if s[:studying_now] == "on"
        situation.studying_now = true
        situation.save
      else
        situation.studying_now = false
        situation.save
      end
    end
  end

  def studying_switches_for_scores #fix this so true values don't persist
    params.permit!
    params[:user][:scores].each do |s|
      score = Score.find(s[:id])
      if s[:studying_now] == "on"
        score.studying_now = true
        score.save
      else
        score.studying_now = false
        score.save
      end
    end
  end

  def the_lineup
    the_situations = []
    the_scores = []
    the_phrases = []
    @situations.each do |s|
      if s.studying_now == true
        the_situations << s.id
      else
        next
      end
    end
    @scores.each do |s|
      if s.studying_now == true
        the_scores << s.id
      else
        next
      end
    end

    the_situations.each do |this_situation_id| #checking situations that are true
      a_situation = @situations.find(this_situation_id) #a single situation that is true

      the_scores.each do |this_score_id| #checking scores that are true
        a_score = @scores.find(this_score_id) #a single true score for this iteration

        all_phrases_in_a_situation = a_situation.phrases.all #all the phrases for the relevant situation
        all_phrases_in_a_situation.each do |this_phrase| #cycling over a given phrase in a true situation
          if (this_phrase.score_id == a_score.id) && (this_phrase.familiarity_score < 100.0)
            the_phrases << this_phrase
          else
            next
          end
        end

      end
    end

    the_phrases

    #a phrase should have the correct id from situations array
    #a phrase should have the correct id from scores array
    #a phrase should also have a score less than the trip wire

      #phrase.familiarity score should autoset at situations home
  end

end
