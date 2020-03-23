class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy] <--this was autogenerated
  skip_before_action :require_login

  #this is for root
  def home_method
    render :home_view
  end

  def about
    #you don't need to do anything to render the about page
  end

  # GET /users/new THIS IS THE SIGN UP FORM/SIGN UP PATH
  def new
    @user = User.new
    render :new
  end

  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    if @user.save
      #login the user
      session[:user_id] = @user.id
      redirect_to situations_path
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :beta_key, :password) #password_digest was previously password...if you left as password_digest it would be stored unhashed (or something like that)
    end
end
