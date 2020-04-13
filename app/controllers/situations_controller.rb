class SituationsController < ApplicationController
  before_action :set_situation, only: [:show, :edit, :update, :destroy]
  before_action :preset_user

  def index
    if logged_in?
      @user # = current_user
      @situations = @user.situations.all
      @situations.each do |situation| #this should be a method on the situation model
        sitch_phrases = situation.phrases.all
        sitch_phrases.each do |phrase|
          #binding.pry
          phrase.familiarity_score = phrase.score.familiarity_name_corresponding_points
          phrase.save
        end
      situation.save
    end
    else
      redirect_to '/'
    end
  end

  def show
    redirect_to "/situations"
  end

  def new
    if logged_in?
      @user #= current_user
      @situation = @user.situations.new
    else
      redirect_to "/"
    end
  end

  def edit
    @situation
  end

  def create
    if logged_in? #change this to a before action
      @user #= current_user
      @situation = @user.situations.new(situation_params) #current_user.situations.new
      @situation.save
      #this_situation = @situation.id this appears to have been vestigial code, but if something goes wrong with situations may need to put it back.
      @situation.whip_up_some_phrases

      redirect_to situations_path
    else
      redirect_to "/"
    end
  end

  def update
    respond_to do |format|
      if @situation.update(situation_params)
        format.html { redirect_to situations_path, notice: 'Situation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
      @situation.destroy
      redirect_to "/situations", notice: 'Situation was successfully deleted.'
  end

  private
    def set_situation
      if logged_in?
        @user = current_user
        @situation = @user.situations.find(params[:id])
      elsif
        @user = current_user
          redirect_to "/situations"
      else
        redirect_to "/"
      end
    end

    def situation_params
      params.require(:situation).permit(:name, :studying_now, :phrase_id, :text_blob_for_phrases, :user_id, :score_average, :score_median, :score_mode)
    end

    def preset_user
      @user = current_user
    end

end
