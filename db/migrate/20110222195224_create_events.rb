class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
	  t.string :description
	  t.string :event_title
	  t.integer :user_id
      t.timestamps
    end
	add_index :events, :user_id
  end

  def self.down
    drop_table :events
  end
end
