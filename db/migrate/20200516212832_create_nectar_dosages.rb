class CreateNectarDosages < ActiveRecord::Migration[5.1]
  def change
    create_table :nectar_dosages do |t|
      t.integer :bee_id
      t.date :date_given
      t.integer :nectar_dosage

      t.index :bee_id

      t.timestamps
    end
  end
end
