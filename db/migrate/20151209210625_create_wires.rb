class CreateWires < ActiveRecord::Migration
  def change
    create_table :wires do |t|

      t.timestamps null: false
    end
  end
end
