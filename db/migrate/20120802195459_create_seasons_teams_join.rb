class CreateSeasonsTeamsJoin < ActiveRecord::Migration
  def change
    create_table :seasons_teams, :id => false do |t|
      t.references :season
      t.references :team
    end
    add_index :seasons_teams, :season_id
    add_index :seasons_teams, :team_id
  end
end
