class CreateRoom < ActiveRecord::Migration[6.0]
  def change
	create_table :rooms do |t|
		t.string            :name, :null => false
		t.string            :dim
		t.string            :desc
		t.integer           :cap, :null => false, :default => 0
		t.string						:image

		t.boolean           :is_del, :null => false, :default => false
		t.boolean           :is_sync, :null => false, :default => true
		t.timestamps
	end
  end
end
