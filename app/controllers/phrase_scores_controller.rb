class PhraseScoresController < ApplicationController
  before_action :set_phrase_score, only: [:show, :edit, :update, :destroy]

  # GET /phrase_scores
  # GET /phrase_scores.json
  def index
    @phrase_scores = PhraseScore.all
  end

  # GET /phrase_scores/1
  # GET /phrase_scores/1.json
  def show
  end

  # GET /phrase_scores/new
  def new
    @phrase_score = PhraseScore.new
  end

  # GET /phrase_scores/1/edit
  def edit
  end

  # POST /phrase_scores
  # POST /phrase_scores.json
  def create
    @phrase_score = PhraseScore.new(phrase_score_params)

    respond_to do |format|
      if @phrase_score.save
        format.html { redirect_to @phrase_score, notice: 'Phrase score was successfully created.' }
        format.json { render :show, status: :created, location: @phrase_score }
      else
        format.html { render :new }
        format.json { render json: @phrase_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrase_scores/1
  # PATCH/PUT /phrase_scores/1.json
  def update
    respond_to do |format|
      if @phrase_score.update(phrase_score_params)
        format.html { redirect_to @phrase_score, notice: 'Phrase score was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrase_score }
      else
        format.html { render :edit }
        format.json { render json: @phrase_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrase_scores/1
  # DELETE /phrase_scores/1.json
  def destroy
    @phrase_score.destroy
    respond_to do |format|
      format.html { redirect_to phrase_scores_url, notice: 'Phrase score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase_score
      @phrase_score = PhraseScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phrase_score_params
      params.require(:phrase_score).permit(:familiarity_rank, :studying_now)
    end
end
