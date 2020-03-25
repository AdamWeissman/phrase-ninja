class SituationsController < ApplicationController
  before_action :set_situation, only: [:show, :update, :destroy]

  # GET /situations
  # GET /situations.json
  def index
    if logged_in?
      @user = current_user
      @situations = @user.situations.all
    else
      redirect_to '/'
    end
  end

  # GET /situations/1
  # GET /situations/1.json
  def show

  end

  # GET /situations/new
  def new
    if logged_in?
      @user = current_user
      @situation = @user.situations.new
    else
      redirect_to "/"
    end
  end

  # GET /situations/1/edit
  def edit

  end

  # POST /situations
  # POST /situations.json
  def create
    if logged_in?
      @user = current_user
      @situation = @user.situations.new(situation_params)
      @situation.save
      this_situation = @situation.id
      @situation.whip_up_some_phrases

      #respond_to do |format|
        #if @situation.save
      redirect_to situations_path
          #format.html { redirect_to @user.situations.all, notice: 'Situation was successfully created.' }
          #format.json { render :index, status: :created, location: @situation }
      #  else
        #  nil
          #render :html "oops"
          #format.html { render :new }
          #format.json { render json: @situation.errors, status: :unprocessable_entity }
      #  end
      #end
    else
      redirect_to "/"
    end
  end

  # PATCH/PUT /situations/1
  # PATCH/PUT /situations/1.json
  #def update
  #  respond_to do |format|
  #    if @situation.update(situation_params)
  #      format.html { redirect_to @situation, notice: 'Situation was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @situation }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @situation.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /situations/1
  # DELETE /situations/1.json
  def destroy
      @situation.destroy
      redirect_to "/situations"
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
      params.require(:situation).permit(:name, :studying_now, :phrase_id, :text_blob_for_phrases, :user_id, :phrase_score_average, :phrase_score_median, :phrase_score_mode)
    end
end
