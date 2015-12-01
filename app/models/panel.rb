class Panel < ActiveRecord::Base
#attr_accessor :init_fault

before_save :set_fault, :set_c_val, :calc_final
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

def set_fault
	if self.fed_from == "Transformer"
		self.init_fault = Project.find_by_id(self.project_id).init_fault
	elsif self.final_value != nil
		self.init_fault = Panel.where(panel_name: self.fed_from).final_value
	else
		self.init_fault = 0
	end
end

def set_c_val
	self.c_value = Cvalue.where(wire_size: self.wire_size, wire_type: self.wire_type, 
		conduit_type: self.conduit_type, runs_type: self.run_type).first.c_value
end

def calc_final
	if self.voltage != 240
		var_volt = 1.73
	else
		var_volt = 2
	end
	  self.f_value = (var_volt * self.wire_length * self.init_fault)/
      (self.runs * self.c_value * self.voltage)
      self.m_value = 1/(1+self.f_value)
      self.final_value = self.init_fault * self.m_value
end


end
