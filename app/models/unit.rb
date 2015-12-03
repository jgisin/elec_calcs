class Unit < ActiveRecord::Base
belongs_to :project
before_save :set_small_app, :set_hvac, :unit_load

scope :sorted, lambda { order("units.sqr_ftg ASC")}

	def set_small_app
		self.small_app = ((((3 * self.sqr_ftg.to_i) / 120)/20)+1) * 1500	
	end

	def set_hvac
		self.hvac = self.heating + self.cooling + self.other_load
	end

	def unit_load
		self.total_unit = (self.sqr_ftg * 3) + self.small_app + self.washer
	end

end
