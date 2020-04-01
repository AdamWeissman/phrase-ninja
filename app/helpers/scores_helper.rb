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
    #a phrase should have the correct id from situations array
    #a phrase should have the correct id from scores array
    #a phrase should also have a score less than the trip wire
      #will need to assign familiarity scores
      #phrase.familiarity score should autoset at situations home
  end

end
