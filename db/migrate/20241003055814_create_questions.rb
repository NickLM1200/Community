class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, primary_key: :questionID do |t|
      t.string :question, null:false, limit:150
      #adminusername being added for accountability
      t.string :admin_username, null: true
      t.timestamps
    end
  end
end
