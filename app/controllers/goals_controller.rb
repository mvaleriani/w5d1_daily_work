class GoalsController < ApplicationController
  def new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      render :new
    end
  end

  def edit
  end

  def index
  end

  def update
  end

  def destroy
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private
  def goal_params
    params.require(:goal).permit(:body, :title, :priv, :completed)
  end
end
