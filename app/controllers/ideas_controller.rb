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

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:message] = "#{@idea.title} was created successfully!"
      redirect_to user_idea_path(@idea.user, @idea)
    else
      flash[:message] = "Unable to create idea. Something went wrong"
      redirect_to new_user_idea_path(current_user)
    end
  end

  def edit
    @images = Image.all
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:message] = "#{@idea.title} successfully updated"
      redirect_to user_idea_path(@idea.user, @idea)
    else
      flash[:message] = "#{@idea.title} was not updated. Maybe a field was left blank?"
      redirect_to user_idea_path(@idea.user, @idea)
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy
      flash[:message] = "#{@idea.title} was deleted"
      redirect_to user_ideas_path(@idea.user)
    else
      flash[:message] = "#{@idea.title} was not deleted. Please try again."
      redirect_to request.referrer
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :content, :category_id, image_ids: [])
  end

end
