class BrightIdeasController < ApplicationController
  def new
    @bright_ideas = BrightIdea.all
  end

  def show
    @bright_idea = BrightIdea.find(params[:id])
  end

  def create  #for likes
    @bright_idea = BrightIdea.new(bright_idea_params)
    @bright_idea.user = current_user
    if @bright_idea.save
      redirect_to "/bright_ideas"
    else
      flash[:errors] = @bright_idea.errors.full_messages
      redirect_to "/bright_ideas"
    end
  end

  def destroy
      @bright_idea = BrightIdea.find(params[:id])
      @bright_idea.destroy
      redirect_to "/bright_ideas"
  end


  def bright_idea_params
    params.require(:bright_idea).permit(:idea, :user_id)
  end
end
