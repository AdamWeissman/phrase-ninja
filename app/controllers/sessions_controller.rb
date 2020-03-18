class SessionsController < ApplicationController
  #skip_before_action :require_login

    def new
      @user = User.new
      render :login
    end

    def create
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to languages_path
      else
        flash[:error] = "Sorry, your username or password was incorrect"
        redirect_to '/login'
      end
    end

    def home
      render :home
    end

    #this is for logout
    def destroy
      session.clear
      #session.reset
      redirect_to '/'
    end



#everything below this line is from Rachel Hawa tutorial on Medium https://medium.com/swlh/google-authentication-strategy-for-rails-5-application-cd37947d2b1b
#Special thanks to fellow student @SHANNON CRABILL http://shannoncrabill.com/ a brilliant developer for pointing this out.

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
