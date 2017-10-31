module AppHelper
	def site_name
		@site_name = DataChild.find_by(name: 'blog title').v
	end

	def site_desc
		@site_name = DataChild.find_by(name: 'blog description').v
	end

	def current_theme
		@theme = DataChild.find_by(name: 'theme').v
	end

	def theme_render_partial (arg, locals = {})
		current_theme
		render file: "/themes/#{@theme}/#{arg}", locals: locals
	end

	def posts
		renders = []

		posts = Post.all
	end

	def md_renderer
		@renderer = Redcarpet::Render::HTML.new
		@md = Redcarpet::Markdown.new(@renderer, extenstions = {})
	end

	def render_post (post)
		md_renderer

		theme_render_partial '_post', {
			post: post,
			md: @md
		}
	end

	def settings_img (key)
		@image = Image.find_by(key: key)

		if @image
			@image.image.url
		else
			false
		end
	end
end
