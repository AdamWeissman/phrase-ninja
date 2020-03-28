class PhrasesController < ApplicationController
  before_action :set_phrase, except: [:destroy, :edit, :update]

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
    binding.pry
  end


  def edit
    if logged_in?
      @user = current_user
      #binding.pry
      @situation = @user.situations.find(params[:situation_id]) #this line must stay like this in order for index to populate
      @phrase = @situation.phrases.find(params[:phrase_id]) #this line must stay like this in order for index to populate
    elsif
      @user = current_user
        redirect_to "/situations"
    else
      redirect_to "/"
    end
  end

  def update
    #binding.pry
    @new_english = params[:phrase][:english]
    @new_category = params[:phrase][:category]
    @user = current_user
    @situation = @user.situations.find(params[:situation_id])
    @phrase = @situation.phrases.find(params[:phrase_id])
    @phrase.english = @new_english
    @phrase.category = @new_category
    @phrase.translate
    @phrase.save
    redirect_to "/situations/#{@situation.id}/phrases", notice: 'Phrase was successfully updated.'
    #respond_to do |format|
    #  if @phrase.update(phrase_params)
    #    format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @phrase }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @phrase.errors, status: :unprocessable_entity }
    #  end
    #end
  end


  def destroy
    if logged_in?
      @user = current_user
      #binding.pry
      @situation = @user.situations.find(params[:situation_id]) #this line must stay like this in order for index to populate
      @phrase = @situation.phrases.find(params[:phrase_id]) #this line must stay like this in order for index to populate
      @phrase.destroy
      redirect_to "/situations/#{@situation.id}/phrases", notice: 'Phrase was successfully updated.'
    elsif
      @user = current_user
        redirect_to "/situations"
    else
      redirect_to "/"
    end
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




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      if logged_in?
        @user = current_user
        #binding.pry
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
