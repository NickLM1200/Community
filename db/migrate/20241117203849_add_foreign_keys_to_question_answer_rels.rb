class AddForeignKeysToQuestionAnswerRels < ActiveRecord::Migration[7.1]
  def change
    # Add foreign key references
    add_column :question_answer_rels, :questionID, :integer, null: false
    add_column :question_answer_rels, :answerID, :integer, null: false

    # Add foreign key constraints
    add_foreign_key :question_answer_rels, :questions, column: :questionID, primary_key: "questionID"
    add_foreign_key :question_answer_rels, :answers, column: :answerID, primary_key: "answerID"
  end
end
