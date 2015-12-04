class Unit < ActiveRecord::Base
belongs_to :project
before_save :set_small_app, :set_hvac, :set_lighting, :demand_load, :total

scope :sorted, lambda { order("units.sqr_ftg ASC")}

	def set_small_app
		self.small_app = ((((3 * self.sqr_ftg.to_i) / 120)/20)+1) * 1500	
	end

	def set_hvac
		self.hvac = self.heating + self.cooling + self.other_load
	end

	def set_lighting
		self.lighting = (self.sqr_ftg * 3) + self.small_app + self.washer
	end

	def total
		self.total_unit = self.demand + self.microwave + self.dishwasher +
		self.disposal + self.dryer + self.hvac
	end

	def demand_load
		self.demand = 3000 + ((self.lighting - 3000)* 0.35)
	end



end
