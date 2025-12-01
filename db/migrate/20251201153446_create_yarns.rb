class CreateYarns < ActiveRecord::Migration[7.1]
  def change
    create_table :yarns do |t|
      t.string :type

      t.timestamps
    end
  end
end
