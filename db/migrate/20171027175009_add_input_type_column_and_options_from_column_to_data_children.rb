class AddInputTypeColumnAndOptionsFromColumnToDataChildren < ActiveRecord::Migration[5.1]
  def change
  	add_column :data_children, :input_type, :string
  	add_column :data_children, :options_from, :string
  end
end
