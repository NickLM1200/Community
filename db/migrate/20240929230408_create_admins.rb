class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins, id:false do |t|
      t.string :username, null:false, limit:15, primary_key:true
      t.string :email, null:false, limit:255
      t.string :firstName, null:false, limit:150
      t.string :password_digest, null:false, limit:80
    end
    #removing as this index is created in the users migration and causing duplicate errors
    #add_index :users, :email, unique: true
    add_index :admins, :email, unique: true
  end
end
