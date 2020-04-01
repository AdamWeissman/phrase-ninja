class ScoresController < ApplicationController
include ScoresHelper
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

  def show #this method is for a single flashcard, and works with the studying switches method for scores
    if logged_in?
      @user = current_user
      @situations = @user.situations.all
      @scores = @user.scores.all
      studying_switches_for_scores
      @phrases = the_lineup
      @phrase = grab_that_phrase(@phrases)
    elsif
      @user = current_user
        redirect_to "/users/:id/flashcards"
    else
      redirect_to "/"
    end
  end


  def new
    @score = Score.new
  end


  def edit
    if logged_in?
      @user = current_user
      params.permit!
      @phrase = Phrase.find(params[:phrase_id])
    elsif
      @user = current_user
        redirect_to "/users/:id/flashcards"
    else
      redirect_to "/"
    end
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
    #will need to assign familiarity scores and reassign score ids
    #respond_to do |format|
    #  if @score.update(phrasescore_params)
    #    format.html { redirect_to @score, notice: 'Score was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @phrasescore }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @score.errors, status: :unprocessable_entity }
    #  end
    #end
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

end
