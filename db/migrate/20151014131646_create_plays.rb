class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :game, index: true, foreign_key: true
      t.integer :turn
      t.references :player, index: true, foreign_key: true
      t.boolean :color
      t.references :op_deck, index: true
      t.references :op_player, index: true
      t.integer :value
      t.integer :time_taken

      t.timestamps null: false
    end
    add_foreign_key :plays, :operations, column: :op_deck_id
    add_foreign_key :plays, :operations, column: :op_player_id

  end
end
