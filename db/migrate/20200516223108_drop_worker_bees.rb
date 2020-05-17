class DropWorkerBees < ActiveRecord::Migration[5.1]
  def change
    drop_table :worker_bees
  end
end
