class ChangeTypeInMaterialToYarn < ActiveRecord::Migration[7.1]
  def change
    remove_column :yarns, :type, :string
    add_column :yarns, :material, :string
  end
end
