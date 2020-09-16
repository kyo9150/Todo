class TasksController < ApplicationController
  protect_from_forgery :except => [:destroy]
  before_action :set_tag
  before_action :set_task,only:[:edit]
  before_action :correct_user ,only:[:edit,:destroy]


  def index
    @tasks = @tag.tasks.includes(:user).order("deadline ASC")
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = @tag.tasks.new(task_params)
    if @task.save
      redirect_to tag_tasks_path(@tag)
    else
      render :new
    end
    
  end
  def done
    @task=Task.find(params[:tag_id])
    @task.update(tag_id)
  end

  def edit
  end
  def update
    task=Task.find(params[:id])
    task.update(task_params)
    redirect_to tag_tasks_path(@tag)

  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tag_tasks_path(@tag)
    
  end

  private

  def task_params
    params.require(:task).permit(:name,:deadline).merge(user_id: current_user.id)
  end

  def set_tag
    @tag = Tag.find(params[:tag_id])
  end
  def set_task
    @task = Task.find(params[:id])
  end
  def correct_user
    user = User.find(params[:id])
    redirect_to root_url if current_user != user
  end
end


