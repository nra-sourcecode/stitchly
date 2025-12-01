class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :designer
      t.string :category
      t.integer :needle_size
      t.string :product_size
      t.references :user, null: false, foreign_key: true
      t.string :difficulty

      t.timestamps
    end
  end
end
