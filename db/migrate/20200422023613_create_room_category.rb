class CreateRoomCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :room_categories do |t|
    	t.string			:name, :null => false
    	t.string			:desc

    	t.boolean			:is_del, :null => false, :default => false
    	t.boolean			:is_sync, :null => false, :default => true
    	t.timestamps
    end
  end
end
