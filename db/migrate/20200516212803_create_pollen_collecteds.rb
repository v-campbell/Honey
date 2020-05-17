class CreatePollenCollecteds < ActiveRecord::Migration[5.1]
  def change
    create_table :pollen_collecteds do |t|
      t.integer :bee_id
      t.date :date_collected
      t.integer :pollen_globs_collected

      t.index :bee_id

      t.timestamps
    end
  end
end
