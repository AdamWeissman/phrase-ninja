class SituationsController < ApplicationController
  before_action :set_situation, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @user = current_user
      @situations = @user.situations.all
      @situations.each do |situation|
        sitch_phrases = situation.phrases.all
        sitch_phrases.each do |phrase|
          phrase.familiarity_score = 0.0
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
      @user = current_user
      @situation = @user.situations.new
    else
      redirect_to "/"
    end
  end

  def edit
    @situation
  end

  def create
    if logged_in?
      @user = current_user
      @situation = @user.situations.new(situation_params)
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
        #format.json { render :show, status: :ok, location: @situation }
      else
        format.html { render :edit }
        #format.json { render json: @situation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situations/1
  # DELETE /situations/1.json
  def destroy
      @situation.destroy
      redirect_to "/situations", notice: 'Situation was successfully deleted.'
      #respond_to do |format|
      #  format.html { redirect_to situations_url, notice: 'Situation was successfully destroyed.' }
      #  format.json { head :no_content }
      #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
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

    # Only allow a list of trusted parameters through.
    def situation_params
      params.require(:situation).permit(:name, :studying_now, :phrase_id, :text_blob_for_phrases, :user_id, :score_average, :score_median, :score_mode)
    end
end
