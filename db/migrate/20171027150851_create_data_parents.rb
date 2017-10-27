class CreateDataParents < ActiveRecord::Migration[5.1]
  def change
    create_table :data_parents do |t|
      t.string :name

      t.timestamps
    end
  end
end
