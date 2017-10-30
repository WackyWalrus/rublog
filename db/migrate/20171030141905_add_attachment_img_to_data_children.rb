class AddAttachmentImgToDataChildren < ActiveRecord::Migration[5.1]
  def self.up
    change_table :data_children do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :data_children, :img
  end
end
