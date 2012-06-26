class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :firstname
      t.string :surname
      t.string :position
      t.text :info
      t.references :team

      t.timestamps
    end
    add_index :players, :team_id
  end
end
