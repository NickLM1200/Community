class CreateQuestionAnswerRels < ActiveRecord::Migration[7.1]
  def change
    create_table :answers, primary_key: :answerID do |t|
      t.string :answer, null:false, limit:150
      #adminusername being added for accountability
      t.string :admin_username, null: true
      t.timestamps
    end
  end
end
