class PhrasesController < ApplicationController
  before_action :set_phrase, only: [:edit, :update, :destroy, :new, :create, :show]

  def index
    if logged_in?
      @user = current_user
      @situation = @user.situations.find(params[:situation_id])

      # Situation.find_by_id(params[:id])
      # Situation.find_by_title(params[:title])
      # Situation.find_by(params[:situation_id])
      # Situation.find(params[:id])

      @phrases = @situation.phrases
    else
      redirect_to '/'
    end
  end

  def show
  end

  def new
    @phrase = Phrase.new
  end


  def edit

  end

  def create
    @phrase = Phrase.new(phrase_params)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to @phrase, notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @phrase.destroy
    redirect_to "/situation/:id/phrases"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      if logged_in?
        @user = current_user
        @situation = @user.situations.find_by(params[:situation_id])
        @phrase = @situation.phrases.find_by(params[:phrase_id])
      elsif
        @user = current_user
          redirect_to "/situations"
      else
        redirect_to "/"
      end
    end

    # Only allow a list of trusted parameters through.
    def phrase_params
      params.require(:phrase).permit(:english, :english_equivalent, :japanese, :japanese_phonetic, :phrase_score_id, :situation_id, :category, :familiarity_score, :studying_now)
    end
end
