class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins, primary_key: :username, id: { type: :string, limit: 15 } do |t|
      t.string :email, null:false, limit:255
      t.string :firstName, null:false, limit:150
      t.string :password_digest, null:false, limit:80
      t.index :email, unique: true
    end

    # Add a trigger to prevent username updates
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE OR REPLACE FUNCTION prevent_username_update()
          RETURNS TRIGGER AS $$
          BEGIN
            IF OLD.username IS DISTINCT FROM NEW.username THEN
              RAISE EXCEPTION 'username cannot be changed once set';
            END IF;
            RETURN NEW;
          END;
          $$ LANGUAGE plpgsql;

          CREATE TRIGGER prevent_username_update_trigger
          BEFORE UPDATE ON admins
          FOR EACH ROW
          EXECUTE FUNCTION prevent_username_update();
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TRIGGER username_update_trigger ON admins;
          DROP FUNCTION prevent_username_update();
        SQL
      end
    end
  end
end
