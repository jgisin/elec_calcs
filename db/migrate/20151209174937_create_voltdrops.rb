class CreateVoltdrops < ActiveRecord::Migration
  def change
    create_table :voltdrops do |t|

    	t.string :wire_size
    	t.integer :wire_type
    	t.integer :phase
    	t.integer :conduit
    	t.integer :power_factor

      t.timestamps null: false
    end
  end
end
