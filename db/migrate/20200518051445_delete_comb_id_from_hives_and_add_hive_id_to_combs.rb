class DeleteCombIdFromHivesAndAddHiveIdToCombs < ActiveRecord::Migration[5.1]
  def change
    remove_column :hives, :comb_id
    add_column :combs, :hive_id, :integer
  end
end
