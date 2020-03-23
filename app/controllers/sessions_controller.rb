class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to situations_path
    else
      flash[:error] = "Sorry #{User.find_by(email: params[:user][:email]).email}, your password is incorrect!"
      redirect_to '/login'
    end
  end


  #this is for logout
  def destroy
    session.clear
    #session.reset
    redirect_to '/'
  end



#everything below this line is from Rachel Hawa tutorial on Medium https://medium.com/swlh/google-authentication-strategy-for-rails-5-application-cd37947d2b1b
#Special thanks to fellow student @SHANNON CRABILL http://shannoncrabill.com/ a brilliant developer for pointing this out.

  def google_auth
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    @user = User.find_or_create_by(current_user)

    @user.update_attributes(:google_token => access_token.credentials.token)

    # Access_token is used to authenticate request made from the rails application to the google server
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request

    refresh_token = access_token.credentials.refresh_token

    @user.update_attributes(google_refresh_token: :refresh_token) if refresh_token.present?

    session[:user_id] = @user.id.to_s
    redirect_to situations_path, notice: 'Successfully connected to Google!' #this must redirect to situations index
  end

  #private

  def auth
    request.env['omniauth.auth']
  end

end
