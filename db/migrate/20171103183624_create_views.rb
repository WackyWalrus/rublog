class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.integer :post_id
      t.string :ip

      t.timestamps
    end
  end
end
