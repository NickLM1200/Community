class AddAnswersToSchema < ActiveRecord::Migration[7.1]
  def change
      create_table :question_answer_rels, primary_key: :qaID do |t| 
        t.references :questionID, foreign_key: {to_table: :questions, primary_key: :questionID}, type: :integer
        t.string :admin_username
        t.timestamps
    end
  end
end
