class PhrasescoresController < ApplicationController
  before_action :set_phrasescore, only: [:show, :edit, :update, :destroy]

  def index
    @phrasescores = Phrasescore.all
  end

  def show
  end

  def new
    @phrasescore = Phrasescore.new
  end


  def edit
  end

  def create
    @phrasescore = Phrasescore.new(phrasescore_params)

    respond_to do |format|
      if @phrasescore.save
        format.html { redirect_to @phrasescore, notice: 'Phrase score was successfully created.' }
        format.json { render :show, status: :created, location: @phrasescore }
      else
        format.html { render :new }
        format.json { render json: @phrasescore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrase_scores/1
  # PATCH/PUT /phrase_scores/1.json
  def update
    respond_to do |format|
      if @phrasescore.update(phrasescore_params)
        format.html { redirect_to @phrasescore, notice: 'Phrase score was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrasescore }
      else
        format.html { render :edit }
        format.json { render json: @phrasescore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrase_scores/1
  # DELETE /phrase_scores/1.json
  def destroy
    @phrasescore.destroy
    respond_to do |format|
      format.html { redirect_to phrasescores_url, notice: 'Phrase score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrasescore
      @phrasescore = Phrasescore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phrasescore_params
      params.require(:phrasescore).permit(:familiarity_name, :familiarity_name_corresponding_points, :studying_now)
    end
end
