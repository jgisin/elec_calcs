class CreateMeterbanks < ActiveRecord::Migration
  def change
    create_table :meterbanks do |t|

    	t.string :bus_name
    	t.integer :unit_count
    	t.string :largest_unit
    	t.float :dryer_demand
    	t.float :load_demand
    	t.integer :lighting
    	t.integer :appliance
    	t.integer :dryer_total
    	t.integer :hvac_total
    	t.integer :total_load


    	#Foreign Key
    	t.integer :project_id

      t.timestamps null: false
    end
  end
end
