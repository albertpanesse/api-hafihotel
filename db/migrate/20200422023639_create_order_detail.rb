class CreateOrderDetail < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
    	t.boolean			:is_del, :null => false, :default => false
    	t.boolean			:is_sync, :null => false, :default => true
    	t.timestamps    	
    end
  end
end
