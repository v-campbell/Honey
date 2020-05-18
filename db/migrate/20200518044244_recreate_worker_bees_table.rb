class RecreateWorkerBeesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :worker_bees do |t|
        t.integer :comb_id
        t.integer :pollen_collected
        t.integer :nectar_consumption
        t.timestamps
    end
  end
end
