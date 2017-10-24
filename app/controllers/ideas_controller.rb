class IdeasController < ApplicationController
  before_action :current_user?, except: [:new, :create]
  before_action @user = :current_user

  def index
    @user
  end

  def show
    @ideas = @user.ideas.find(params[:id])
    if @ideas.nil?
      redirect_to user_path(@user)
    end
  end
end
