class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :game, index: true, foreign_key: true
      t.integer :turn
      t.references :player, index: true, foreign_key: true
      t.boolean :color
      t.integer :op_deck
      t.integer :op_player
      t.integer :value
      t.integer :time_taken

      t.timestamps null: false
    end
  end
end
