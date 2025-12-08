class AddDefaultToStatusInProjects < ActiveRecord::Migration[7.1]
  def change
    change_column_default :projects, :status, "not started"
  end
end
