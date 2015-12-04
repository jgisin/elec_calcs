class CreateLoadDemands < ActiveRecord::Migration
  def change
    create_table :load_demands do |t|
    	t.integer :unit_count
    	t.float :demand

      t.timestamps null: false
    end
  end
end
