class ChangeParentIdToDataParentId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :data_children, :parent_id, :data_parent_id
  end
end
