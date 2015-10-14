class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :game, index: true, foreign_key: true
      t.integer :turn
      t.references :player, index: true, foreign_key: true
      t.boolean :color
      t.references :op_deck, references: :operations
      t.references :op_player, references: :operations
      t.integer :value
      t.integer :time_taken

      t.timestamps null: false
    end
  end
end
