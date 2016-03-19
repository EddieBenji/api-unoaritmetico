class ChangePlaysTable < ActiveRecord::Migration
  def change
    remove_foreign_key :plays, :player
    remove_index :plays, :player_id

    rename_column :plays, :player_id, :player
    change_column :plays, :player, :string
  end
end
