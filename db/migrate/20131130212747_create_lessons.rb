class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :user
      t.string     :instructor
      t.date       :date
      t.string     :body
      t.boolean    :solved, default: false

      t.timestamps
    end
    add_index :lessons, :user_id
  end
end
