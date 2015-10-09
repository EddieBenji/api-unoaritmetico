class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date_game
      t.string :device_id
      t.references :play, index: true, foreign_key: true
    end
  end
end
