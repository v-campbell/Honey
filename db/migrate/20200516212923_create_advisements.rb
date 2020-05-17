class CreateAdvisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advisements do |t|
      t.date :from_date
      t.date :to_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
