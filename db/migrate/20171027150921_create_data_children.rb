class CreateDataChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :data_children do |t|
      t.integer :parent_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
