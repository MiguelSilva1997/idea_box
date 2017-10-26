class Admin::BaseController < ApplicationController
  before_action :user_admin?

  def dashboard
    @users = User.all
    @ideas = Idea.all
    @categories = Category.all
  end

private  
 def user_admin?
   render file: '/public/404' unless current_admin?
 end

end
