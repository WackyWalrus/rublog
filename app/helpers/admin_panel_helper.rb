module AdminPanelHelper
	def data_to_form_label(*args)
		args[0].label :v, args[0].object[:name]
	end

	def data_to_form_field(*args)
		if args[0].object.input_type === 'select'
			args[0].select :v, get_options(args[0]), {}, class: 'form-control'
		else

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
