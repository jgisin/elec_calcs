class CreateCvalues < ActiveRecord::Migration
  def change
    create_table :cvalues do |t|
	      t.string :wire_size
	      t.integer :wire_type
	      t.integer :conduit_type
	      t.integer :runs_type
	      t.integer :c_value
      t.timestamps null: false
    end
  end
end
