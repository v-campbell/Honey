class CreateCombs < ActiveRecord::Migration[5.1]
  def change
    create_table :combs do |t|
      t.integer :sweet_spot

      t.timestamps
    end
  end
end
