class Project < ActiveRecord::Base

#attr_accessor :name
belongs_to :user	
has_many :panels, :dependent => :destroy

scope :sorted, lambda { order("projects.position ASC")}

validates_presence_of :name
validates_length_of :name, :maximum => 50
validates_length_of :description, :maximum => 255
validates_uniqueness_of :name, :scope => :user_id

end
