class Player < ActiveRecord::Base

  attr_accessible :firstname, :surname, :position, :info

  validates :firstname, :surname,
  	:presence => true

  validates :firstname, :surname, :position,
  	:length => { :maximum => 255 }

  validates :info,
  	:length => { :maximum => 1020 }

  belongs_to :team

end
