class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|

        t.string :unit_name
    	t.integer :unit_meter #how many units in meter bank
    	t.integer :bedrooms #how many
    	t.float :sqr_ftg #for use in max sqr ftg calcs
    	t.integer :small_app #for small appliance load after calc
    	t.integer :washer, default: 0
    	t.integer :microwave, default: 0
    	t.integer :dishwasher, default: 0
    	t.integer :disposal, default: 0
    	t.integer :dryer, default: 0
    	t.integer :hvac #calculated with heat and a/c
        t.integer :heating, default: 0
        t.integer :cooling, default: 0
        t.integer :other_load, default: 0
    	t.integer :total_unit
    	t.integer :voltage #per unit or per meter bank

    	#Foreign Key
    	t.integer :project_id

      t.timestamps null: false
    end
  end
end
