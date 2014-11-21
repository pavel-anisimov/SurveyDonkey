class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :platoon,       null: false, default: 0
      t.integer :squad,         null: false, default: 0
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
