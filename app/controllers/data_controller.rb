class DataController < ApplicationController
	def save
		fields = params[:data_parent][:children_attributes]

		fields.each do |field|
			data_child = DataChild.find(fields[field][:id])

			if data_child[:input_type] === 'image'

				params[:data_parent][:children_attributes][field].delete(:id)

				if Image.find_by(key: data_child.name)
					img = Image.find_by(key: data_child.name)
					img.update(image_params[:children_attributes][field])
				else
					img = Image.new(image_params[:children_attributes][field])
					img.key = data_child.name
					img.save
				end

			else
				fields[field].each do |key, val|
					if key != 'id'
						data_child[key] = val
					end
				end
			end


			data_child.save

		end

		redirect_to params[:redirect_to]
	end

	private
		def image_params
			params.require(:data_parent).permit!
		end

end
