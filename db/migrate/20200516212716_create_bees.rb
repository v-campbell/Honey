class CreateBees < ActiveRecord::Migration[5.1]
  def change
    create_table :bees do |t|
      t.integer :nectar_consumption
      t.integer :pollen_collected

      t.timestamps
    end
  end
end
