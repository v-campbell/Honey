class DeletePollenCollectedAndNectarConsumptionFromBeesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :worker_bees, :pollen_collected
    remove_column :worker_bees, :nectar_consumption
  end
end
