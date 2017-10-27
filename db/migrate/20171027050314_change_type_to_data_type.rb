class ChangeTypeToDataType < ActiveRecord::Migration[5.1]
  def change
  	rename_column :data, :type, :data_type
  end
end
