class ChangeColumnNameOnTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :comment, :description
  end
end
