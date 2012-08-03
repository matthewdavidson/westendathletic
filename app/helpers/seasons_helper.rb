module SeasonsHelper

	def get_teams_hash
		Hash.new.tap do |teams_hash|
			Team.all.each do |team|
				teams_hash[team.name] = team.id
			end
		end
	end

end