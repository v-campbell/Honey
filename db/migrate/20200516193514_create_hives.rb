class CreateHives < ActiveRecord::Migration[5.1]
  def change
    create_table :hives do |t|
      t.integer :comb_id

      t.index :comb_id, unique: true

      t.timestamps
    end
  end
end
