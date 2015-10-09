class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :turn
      t.string :player
      t.string :color
      t.string :op_deck
      t.string :op_player
      t.string :value
    end
  end
end
