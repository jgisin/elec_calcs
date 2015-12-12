class CreateWires < ActiveRecord::Migration
  def change
    create_table :wires do |t|

    	t.string :wire_size
    	t.integer :wire_type
    	t.integer :temp    	
    	t.integer :ampacity


      t.timestamps null: false
    end
  end
end
