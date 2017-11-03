class AppController < ApplicationController
	include UsersHelper
	include AppHelper

	def startup
		if User.count > 0
			current_theme

			render file: "/themes/#{@theme}/index"
		else
			redirect_to users_new_url
		end
	end

	def post
		current_theme

		@post = Post.find(params[:id])

		@post.view(request.remote_ip)

		render file: "/themes/#{@theme}/posts/"
	end
end
