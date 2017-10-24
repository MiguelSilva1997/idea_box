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

  def new
    @idea = Idea.new
    @categories = Category.all
    @images = Images.all
  end

  def edit
    @images = Image.all
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content, :category_id, image_ids: [])
  end

end
