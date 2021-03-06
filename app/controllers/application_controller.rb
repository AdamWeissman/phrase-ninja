class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :require_login

  private
    def check_for_logged_in
      redirect_to '/' if !logged_in?
    end

    def preset_user
      @user = current_user
    end

end
