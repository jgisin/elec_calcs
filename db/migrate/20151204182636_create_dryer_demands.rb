class CreateDryerDemands < ActiveRecord::Migration
  def change
    create_table :dryer_demands do |t|

    	t.integer :count
    	t.float :demand

      t.timestamps null: false
    end
  end
end
