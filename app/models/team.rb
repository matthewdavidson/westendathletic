class Team < ActiveRecord::Base

  attr_accessible :name, :info, :home_team

  validates :name,
  	:presence => true, :length => { :maximum => 255 }

  validates :info,
  	:length => { :maximum => 1020 }

  has_many :players
  has_and_belongs_to_many :seasons

end
