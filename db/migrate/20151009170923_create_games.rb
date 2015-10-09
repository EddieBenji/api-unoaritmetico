class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date_game
      t.string :device_id

      t.timestamps null: false
    end
  end
end
