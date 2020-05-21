class ChangeAdvisementsCombIdToBeeId < ActiveRecord::Migration[5.1]
  def change
    remove_column :advisements, :comb_id
    add_column :advisements, :bee_id, :integer
  end
end
