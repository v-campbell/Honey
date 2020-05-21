class AddValueToAdvisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advisements, :value, :integer
  end
end
