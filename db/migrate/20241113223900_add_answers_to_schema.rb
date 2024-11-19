class AddAnswersToSchema < ActiveRecord::Migration[7.1]
  def change
      create_table :question_answer_rels, primary_key: :qaID do |t| 
        t.references :questionID, foreign_key: {to_table: :questions, primary_key: :questionID}, type: :integer
        t.references :answerID, foreign_key: {to_table: :answers, primary_key: :answerID}, type: :integer
        t.timestamps
    end
  end
end
