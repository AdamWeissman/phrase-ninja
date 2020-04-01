class ScoresController < ApplicationController

#before_action :set_user, only: [:index]
#this will essentially be the flashcards controller
#skip_before_action :verify_authenticity_token

  def index
    if logged_in?
      @user = current_user
      @situations = @user.situations.all
      @scores = @user.scores.all
      studying_switches_for_situations
    elsif
      @user = current_user
        redirect_to "/situations"
    else
      redirect_to "/"
    end
  end

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

  def show #this method is for a single flashcard, and works with the studying switches method for scores
    if logged_in?
      @user = current_user
      @situations = @user.situations.all
      @scores = @user.scores.all
      studying_switches_for_scores
      @phrases = the_lineup
    elsif
      @user = current_user
        redirect_to "/users/:id/flashcards"
    else
      redirect_to "/"
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
  #need to create @phrases based on:
    #the_situations
    #and also...
      #a given score.phrases.all
      # NOTE: the edit page, when user selects their familiarity will alter the score and also add a value
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

  def new
    @score = Score.new
  end


  def edit
    #this will populate a phrase flash card with the solution
  end

  #def create
  #  @score = Score.new(score_params)

  #  respond_to do |format|
  #    if @score.save
  #      format.html { redirect_to @score, notice: 'Score was successfully created.' }
  #      format.json { render :show, status: :created, location: @score }
  #    else
  #      format.html { render :new }
  #      format.json { render json: @score.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update
    #this is where there user selects the score
    respond_to do |format|
      if @score.update(phrasescore_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrasescore }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end


  #def destroy
  #  @score.destroy
  #  respond_to do |format|
  #    format.html { redirect_to scores_url, notice: 'score was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
  #def set_user
  #    @user = current_user
  #end



    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:familiarity_name, :familiarity_name_corresponding_points, :studying_now)
    end

    def study_params

    end
end
