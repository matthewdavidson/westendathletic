class Season < ActiveRecord::Base

  attr_accessible :name, :start_date, :end_date, :competition_id

  validates :name, :start_date, :competition,
  	:presence => true

  validates :name,
  	:length => { :maximum => 255 }

  belongs_to :competition

end
