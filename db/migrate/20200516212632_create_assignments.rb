class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.integer :bee_id
      t.integer :comb_id
      t.date :from_date
      t.date :to_date

      t.index :bee_id
      t.index :comb_id

      t.timestamps
    end
  end
end
