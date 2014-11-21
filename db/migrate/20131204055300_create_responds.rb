class CreateResponds < ActiveRecord::Migration
  def change
    create_table :responds do |t|
      t.references :user
      t.references :lesson
      t.string :body
      t.string :respond_type

      t.timestamps
    end
    add_index :responds, :user_id
    add_index :responds, :lesson_id
  end
end
