class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tags.new(tag_params)
    if @tag.save
      redirect_to root_path, notice: 'タグを作成しました'
    else
      render :new
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name,).merge(user_id: current_user.id)
  end
end
