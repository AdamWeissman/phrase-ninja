class ScoresController < ApplicationController

#before_action :set_user, only: [:index]
#this will essentially be the flashcards controller
#skip_before_action :verify_authenticity_token

  def index
    if logged_in?
      @user = current_user
      @situations = @user.situations.all
      @scores = @user.scores.all
      snarf
      #writing a method to grab all the situation pairs that need to be updated to studying true
      #if not set to on, then should set them to false

      elsif
      @user = current_user
        redirect_to "/situations"
    else
      redirect_to "/"
    end
  end

  def snarf
    #binding.pry
    #the_situations = []
    #the_booleans = []

    #params.permit!
    params[:user][:situations].each do |s|
      situation = Situation.find(s[:id])
      if s[:studying_now] == "on"
        situation.studying_now = true
        situation.save
      else
        situation.studying_now = false
        situation.save
      end

      #the_situations << s[:id]
      #if s[:studying_now] == "on"
        #the_booleans << true
    #  else
        #the_booleans << false
      #end
      #@situations.map do |x|
        #x.studying_now = true
      #end
    end

  end

  #nothing below this line is working

  def show
    #this will be populate a phrase flash card without a solution
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
