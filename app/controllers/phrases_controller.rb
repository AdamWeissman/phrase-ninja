class PhrasesController < ApplicationController
  before_action :set_phrase #except: [:destroy]

  def index
    if logged_in?
      @user = current_user
      @situation = @user.situations.find(params[:situation_id])
      @phrases = @situation.phrases
      #binding.pry
    else
      redirect_to '/'
    end
  end

  def show
    #@phrase = @situation.phrases.find(params[:id])
  end

  def new
    @phrase = Phrase.new
  end


  def edit
    #binding.pry
    @phrase = @situation.phrases.find(params[:id])
  end

  def destroy
    binding.pry
    @phrase = @situation.phrases.find(params[:phrase_id])
    @phrase.destroy
    #@situation = Situation.phrases.find_by(@phrase.id)
    redirect_to "/situations/:id/phrases"
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



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      if logged_in?
        @user = current_user
        binding.pry
        @situation = @user.situations.find(params[:situation_id]) #this line must stay like this in order for index to populate
        @phrase = @situation.phrases.find_by(params[:phrase_id]) #this line must stay like this in order for index to populate
      elsif
        @user = current_user
          redirect_to "/situations"
      else
        redirect_to "/"
      end
    end

    # Only allow a list of trusted parameters through.
    def phrase_params
      params.require(:phrase).permit(:english, :english_equivalent, :japanese, :japanese_phonetic, :phrase_score_id, :situation_id, :category, :familiarity_score, :studying_now, :id)
    end
end
