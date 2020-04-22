class CreateOrder < ActiveRecord::Migration[6.0]
	def change
		create_table :orders do |t|
			t.datetime		:order_date
			
			t.boolean			:is_del, :null => false, :default => false
			t.boolean			:is_sync, :null => false, :default => true
			t.timestamps
		end
	end
end
