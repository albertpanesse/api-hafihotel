class CreateProperties < ActiveRecord::Migration[6.0]
	def change
		create_table :properties do |t|
			t.integer 		:roomNum, :null => false
			t.string			:status, :null => false, :default => 'F'
			t.integer			:customer_ref
			t.datetime		:checkin
			t.datetime		:checkout
			
			t.boolean			:is_del, :null => false, :default => false
			t.boolean			:is_sync, :null => false, :default => true
			t.timestamps
		end
	end
end
