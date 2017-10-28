class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_user?
    render file: '/public/404' unless current_user
  end

end
