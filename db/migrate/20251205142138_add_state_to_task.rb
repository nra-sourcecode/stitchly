class AddStateToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :state, :boolean, default: false
  end
end
