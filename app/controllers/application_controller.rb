class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def correct_user
  	redirect_to login_path unless is_logged_in? 
  end
end
