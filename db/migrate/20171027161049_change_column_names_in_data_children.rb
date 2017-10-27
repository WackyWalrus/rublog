class ChangeColumnNamesInDataChildren < ActiveRecord::Migration[5.1]
  def change
  	rename_column :data_children, :key, :k
  	rename_column :data_children, :value, :v
  end
end
