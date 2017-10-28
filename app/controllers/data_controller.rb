class DataController < ApplicationController
	def save
		fields = params[:data_parent][:children_attributes]

		fields.each do |field|
			data_child = DataChild.find(fields[field][:id])

			fields[field].each do |key, val|
				if key != 'id'
					data_child[key] = val
				end
			end

			data_child.save

			redirect_to params[:redirect_to]
		end
	end

end
