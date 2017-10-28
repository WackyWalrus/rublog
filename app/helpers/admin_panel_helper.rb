module AdminPanelHelper
	def data_to_form_label(*args)
		args[0].label :v, args[0].object[:name]
	end

	def data_to_form_field(*args)
		if args[0].object.input_type === 'select'
			args[0].select :v, get_options(args[0]), {}, class: 'form-control'
		elsif args[0].object.input_type === 'text'
			args[0].text_field :v, class: 'form-control'
		elsif args[0].object.input_type === 'textarea'
			args[0].text_area :v, class: 'form-control'
		end
			
	end

	def get_options(arg)
		if arg.object[:name] === 'theme'
			dirs = Dir.entries('./themes/')
			@themes = []
			i = 0

			dirs.each do |dir|
				i += 1
				if (i > 2)
					@themes.push(dir)
				end
			end

			return options_for_select(@themes, arg.object[:v])
		end
	end
end
