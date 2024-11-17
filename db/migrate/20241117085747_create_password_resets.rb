class CreatePasswordResets < ActiveRecord::Migration[7.1]
  def change
    create_table :password_resets do |t|
      t.string :user_id, null: false  # This will store the username of the user
      t.string :reset_digest, null: false
      t.datetime :reset_sent_at, null: false
      t.timestamps
    end
    add_foreign_key :password_resets, :users, column: :user_id, primary_key: :username
    add_index :password_resets, :user_id
  end
end