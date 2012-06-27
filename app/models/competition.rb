class Competition < ActiveRecord::Base

  attr_accessible :name

  validates :name, 
  	:presence => true, :length => { :maximum => 255 }

  has_many :seasons

end
