class TagsController < ApplicationController
  protect_from_forgery :except => [:destroy]
  def index
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tag_tasks_path(@tag), notice: 'タグを作成しました'
    else
      render :new
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    if tag.destroy
      redirect_to root_path
    else
      render :destroy
    end

  end

  private
  def tag_params
    params.require(:tag).permit(:name).merge(user_id: current_user.id)
  end
end
