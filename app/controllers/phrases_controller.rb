class PhrasesController < ApplicationController
  before_action :set_phrase, only: [:edit, :update, :destroy, :new, :create]

  # GET /phrases
  # GET /phrases.json
  def index
    #if params[:situation_id]
    if logged_in?
      @user = current_user
      @situation = @user.situations.find_by_id(params[:id])
      @phrases = @situation.phrases.all
    else
      redirect_to '/'
    end
    #else
    #  @phrases = Phrase.all
    #end
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
  end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  # POST /phrases.json
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

  # PATCH/PUT /phrases/1
  # PATCH/PUT /phrases/1.json
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

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to phrases_url, notice: 'Phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phrase_params
      params.require(:phrase).permit(:english, :english_equivalent, :japanese, :japanese_phonetic, :phrase_score_id, :situation_id, :category, :familiarity_score, :studying_now)
    end
end
