class Player < ActiveRecord::Base

  attr_accessible :firstname, :surname, :position, :info, :team_id

  validates :firstname, :surname, :team,
  	:presence => true

  validates :firstname, :surname, :position,
  	:length => { :maximum => 255 }

  validates :info,
  	:length => { :maximum => 1020 }

  belongs_to :team

end
