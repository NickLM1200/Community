class CreateQuestionAnswerRels < ActiveRecord::Migration[7.1]
  def change
    create_table :answers, primary_key: :answerID do |t|
      t.string :answer, null:false, limit:150
      #adminusername being added for accountability
      t.references :admin_username, foreign_key: {to_table: :admins, primary_key: :username}, type: :string
      t.timestamps
    end
  end
end
