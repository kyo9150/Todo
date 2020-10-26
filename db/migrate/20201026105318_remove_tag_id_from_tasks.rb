class RemoveTagIdFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :tag_id, foreign_key: true
  end
end
