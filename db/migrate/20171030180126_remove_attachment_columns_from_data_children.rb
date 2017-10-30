class RemoveAttachmentColumnsFromDataChildren < ActiveRecord::Migration[5.1]
  def change
  	remove_column :data_children, :img_file_name
  	remove_column :data_children, :img_content_type
  	remove_column :data_children, :img_file_size
  	remove_column :data_children, :img_updated_at
  end
end
