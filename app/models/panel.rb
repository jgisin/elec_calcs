class Panel < ActiveRecord::Base

belongs_to :project
#acts_as_list :scope => :project

scope :sorted, lambda { order("panels.position ASC")}

validates_presence_of :panel_name
validates_length_of :panel_name, :maximum => 50
validates_uniqueness_of :panel_name, :scope => :project_id
validates_presence_of :wire_length
validates_presence_of :runs
validates_presence_of :wire_type
validates_presence_of :conduit_type
validates_presence_of :run_type

end
