class AddCommentToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :comment, :text
  end
end
