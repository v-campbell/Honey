class CreateWorkerBees < ActiveRecord::Migration[5.1]
  def change
    create_table :worker_bees do |t|

      t.timestamps
    end
  end
end
