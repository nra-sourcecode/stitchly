class FixDefaultToStatusInProjects < ActiveRecord::Migration[7.1]
  def change
    change_column :projects, :status, :string, default: "not started"
  end
end
