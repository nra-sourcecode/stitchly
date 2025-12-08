class ChangeFieldNiddleSize2 < ActiveRecord::Migration[7.1]
  def change
    remove_column :projects, :needle_size, :integer
    add_column :projects, :needle_size, :float
  end
end
