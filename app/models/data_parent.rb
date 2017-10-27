class DataParent < ApplicationRecord
	has_many :children, class_name: 'DataChild', foreign_key: 'data_parent_id'

	accepts_nested_attributes_for :children
end
