class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    redirect_to login_path unless current_user
  end

end
