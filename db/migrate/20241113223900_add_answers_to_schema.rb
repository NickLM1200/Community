class AddAnswersToSchema < ActiveRecord::Migration[7.1]
  def change
      create_table :question_answer_rels, primary_key: :qaID do |t| 
        t.string :admin_username, null: true
        t.timestamps
    end
  end
end
