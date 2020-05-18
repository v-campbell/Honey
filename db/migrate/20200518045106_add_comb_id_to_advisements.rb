class AddCombIdToAdvisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advisements, :comb_id, :integer
  end
end
