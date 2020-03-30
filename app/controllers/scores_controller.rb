class ScoresController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      @scores = @user.scores.all
    elsif
      @user = current_user
        redirect_to "/situations"
    else
      redirect_to "/"
    end
  end

  def show
  end

  def new
    @score = Score.new
  end


  def edit
  end

  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
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


  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to scores_url, notice: 'score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:familiarity_name, :familiarity_name_corresponding_points, :studying_now)
    end
end
