class IdeasController < ApplicationController
  before_action :current_user?, except: [:new, :create]
  before_action @user = :current_user

  def index
    @user
  end

  def show
    @idea = @user.ideas.find(params[:id])
    if @ideas.nil?
      redirect_to user_path(@user)
    end
  end

  def new
    @idea = Idea.new
    @categories = Category.all
    @images = Image.all
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
    @categories = Category.all
    @images = Image.all
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:message] = "#{@idea.title} successfully updated"
      redirect_to user_idea_path(@idea.user, @idea) if @user.role != "admin"
      redirect_to admin_idea_path(@idea) if @user.role == "admin"
    else
      flash[:message] = "#{@idea.title} was not updated. Maybe a field was left blank?"
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    image_idea = ImageIdea.where(idea_id: params[:id])
    image_idea.destroy_all
    if @idea.destroy
      flash[:message] = "#{@idea.title} was deleted"
      redirect_to user_ideas_path(@idea.user) if @user.role != "admin"
      redirect_to admin_ideas_path(@idea.user) if @user.role == "admin"
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
