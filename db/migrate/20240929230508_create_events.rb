class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, primary_key: :eventid do |t|  # this way ruby can set event id as the main key and serial without crazy methods    
      t.string :title, limit: 150, null: false  # Title must be present, max 150 characters
      t.date :eventDate, null: false        # Event date
      t.time :eventTime, null: false        # Event time
      t.text :eventDescription, null: false # Event description
      t.string :street, limit: 255, null: false  # Street address
      t.string :city, limit: 100, null: false    # City name
      t.string :eventState, limit: 2, null: false, default: 'CO'  # Limiting state to "CO"
      t.integer :zipcode, null: false       # Zipcode
      t.boolean :isVirtual, null: false     # Boolean to indicate if the event is virtual
      t.string :meetingLink, limit: 2050    # Optional meeting link for virtual events
      t.boolean :eventstatus, null: false   # Event status (boolean, required because only approved events will be displayed)
      
      # Foreign key relationships
      t.references :organization, foreign_key: { to_table: :organizations, primary_key: :organizationId }, type: :integer
      t.references :user, foreign_key: { to_table: :users, primary_key: :username }, type: :string
      t.references :admin, foreign_key: { to_table: :admins, on_delete: :nullify, primary_key: :username }, type: :string

      t.timestamps
    end
  end
end
