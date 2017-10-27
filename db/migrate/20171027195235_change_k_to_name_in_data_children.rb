class ChangeKToNameInDataChildren < ActiveRecord::Migration[5.1]
  def change
  	rename_column :data_children, :k, :name
  end
end
