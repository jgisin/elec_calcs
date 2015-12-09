class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      #Panel Variables
      t.string :panel_name
      t.integer :position
      t.float :wire_length
      t.float :init_fault
      t.string :fed_from
      t.float :runs
      t.float :voltage
      t.string :wire_size
      t.integer :wire_type
      t.integer :conduit_type
      t.integer :run_type
      #Result Variables
      t.float :c_value
      t.float :f_value
      t.float :m_value
      t.float :final_value
      t.float :volt_drop
      #Foreign Key
      t.integer :project_id

    end
  end
end
