class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
    	t.string			:full_name, :null => false
    	t.string			:email, :null => false
    	t.string			:phone

			t.boolean			:is_del, :null => false, :default => false
			t.boolean			:is_sync, :null => false, :default => true
      t.timestamps
    end
  end
end