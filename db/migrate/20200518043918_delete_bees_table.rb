class DeleteBeesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :bees
  end
end
