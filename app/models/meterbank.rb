class Meterbank < ActiveRecord::Base
	belongs_to :project
	before_save :unit, :set_total

	def unit
		Unit.where(:unit_name => self.largest_unit).first
	end

	def demand_total
		lighting = self.unit.lighting * self.unit_count
		if lighting > 120000
			(((lighting - 120000) * 0.25) + 40950 + 3000).to_i
		else 
			(((lighting - 3000) * 0.35) + 3000).to_i
		end
	end

	def appliance_total
		(((self.unit.microwave + self.unit.dishwasher +
		self.unit.disposal) * 0.75 ) * self.unit_count).to_i
	end

	def dryer_total
		((self.unit.dryer * self.unit_count) * 
		(DryerDemand.where(:count => self.unit_count).first.demand)).to_i
	end

	def hvac_total
		self.unit.hvac * self.unit_count
	end

	def set_total
		self.total_load = (self.demand_total + self.appliance_total +
		self.dryer_total + self.hvac_total)
	end
	
end
