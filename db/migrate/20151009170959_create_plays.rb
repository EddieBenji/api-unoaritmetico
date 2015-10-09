class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :game, index: true, foreign_key: true
      t.string :turn
      t.string :player
      t.string :color
      t.string :op_deck
      t.string :op_player
      t.string :value

      t.timestamps null: false
    end
  end
end
