class CreateConfig < ActiveRecord::Migration[6.0]
  def change
    create_table :configs do |t|
    	t.string 			:cfg_name, :null => false
    	t.string			:cfg_type, :null => false
    	t.string			:cfg_value

    	t.boolean			:is_del, :null => false, :default => false
    	t.boolean			:is_sync, :null => false, :default => true
    	t.timestamps
    end
  end
end
