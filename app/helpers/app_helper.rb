module AppHelper
	def current_theme
		@theme = DataChild.find_by(name: 'theme').v
	end

	def theme_render_partial (arg)
		current_theme
		render file: "/themes/#{@theme}/#{arg}"
	end
end
