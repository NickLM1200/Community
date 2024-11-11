class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews, primary_key: :reviewID do |t|
      t.references :organizationID, foreign_key: {to_table: :organizations, primary_key: :organizationId}, type: :integer, null:true
      t.references :userID, foreign_key: {to_table: :users, primary_key: :username}, type: :string, null: true
      t.string :title, null:true, limit:150
      t.text :comment, null:true
      t.decimal :starValue, null:false, precision:2, scale:1
      t.timestamps
      t.references :adminID, foreign_key: {to_table: :admins, on_delete: :nullify, primary_key: :username}, type: :string, null:true
      t.boolean :reviewStatus, null:false
    end
  end
end
