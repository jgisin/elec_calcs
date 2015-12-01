class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.string :description
    	t.string :project_type
    	t.integer :position
    	t.float :init_fault
        t.integer :user_id
    end
        add_foreign_key :panels, :projects
  end
end
