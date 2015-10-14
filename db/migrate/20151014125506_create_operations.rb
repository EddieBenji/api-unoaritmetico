class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
    end
  end
end
