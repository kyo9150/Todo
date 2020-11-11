class TasksController < ApplicationController
  protect_from_forgery :except => [:destroy]
  before_action :set_tag,except:[:done,:doing]
  before_action :set_task,only:[:edit]
  before_action :correct_user ,only:[:edit,:destroy]


  def index    
    @tasks = @tag.tasks.includes(:user).order("deadline ASC")
    @tags = Tag.where(user_id: current_user.id)

  end
  
  def new
    # @task=Task.find(params[:tag_id])
    if current_user.id == @tag.user_id
      @task = Task.new
    else
      redirect_to root_path
    end
  end

  def create
    @task = @tag.tasks.new(task_params)
    if @task.save
      redirect_to tag_tasks_path(@tag)
    else
      render :new
    end
    
  end

  def finish
    @task = Task.find(params[:id])
    if @task.completed.present?
      @task.update_attribute(:completed, nil)
      redirect_to tasks_done_path
    else
      @task.update_attribute(:completed, true)
      redirect_to tag_tasks_path(@tag)
    end
  end

  def done
    @done = Task.where(user_id: current_user.id,completed:1).order("deadline ASC")
    @tags = Tag.where(user_id: current_user.id)
  end

  def doing
    @done = Task.where(user_id: current_user.id,completed:nil).order("deadline ASC")
    @tags = Tag.where(user_id: current_user.id)
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
    if @task.completed.present?
      redirect_to tasks_done_path
    else
      redirect_to tag_tasks_path(@tag)
    end
  end

  private

  def task_params
    params.require(:task).permit(:name,:deadline,:detail).merge(user_id: current_user.id)
  end

  def set_tag
    @tag = Tag.find(params[:tag_id])
  end
  def set_task
    @task = Task.find(params[:id])
  end
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to root_url
      end
  end
end


