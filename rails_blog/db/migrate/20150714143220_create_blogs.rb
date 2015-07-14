class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
