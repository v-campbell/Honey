class DropSecondDateFromAdvisements < ActiveRecord::Migration[5.1]
  def change
    remove_column :advisements, :from_date
    remove_column :advisements, :to_date
    add_column :advisements, :date_given, :date
  end
end
