module ApplicationHelper
  #creates instance variable for current user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  #checks if user is logged in
  def logged_in?
    !!session[:user_id]
  end

  #creates before action
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
  end
end

    #THESE METHODS BELOW ARE FROM MY SINATRA PROJECT ARIADNE FOR CONTRAST
    #def current_user
    #  @current_user ||= User.find(session[:your_session])
    #end

    #def logged_in?
    #  !!session[:your_session] #!! converts variable to its boolean value
    #end

    #def authenticated_project?
    #  @project.user_id == @user.id
    #end
