class Panel < ActiveRecord::Base


before_save :set_fault, :set_c_val, :calc_final, :voltdrop
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
		self.init_fault = Project.find(self.project_id).init_fault
	else
		self.init_fault = Panel.where(panel_name: self.fed_from).first.final_value
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

def voltdrop
	if self.voltage != 240
		phase = 1
	else
		phase = 0
	end
	self.volt_drop = (((1/self.runs) * ((self.wire_length *
	 self.conn_ampacity) *
	 Voltdrop.where(wire_size: self.wire_size, wire_type: self.wire_type - 1, phase: phase,
	 conduit: self.conduit_type - 1).first.power_factor)) / 10000) / self.voltage
end


end
