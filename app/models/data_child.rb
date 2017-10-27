class DataChild < ApplicationRecord
	belongs_to :parent, class_name: 'DataParent', optional: true
end
