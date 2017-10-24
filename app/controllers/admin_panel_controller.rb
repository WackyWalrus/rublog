class AdminPanelController < ApplicationController
	include UsersHelper

	def index
		current_user

		if @current_user === false
			redirect_to '/users/login'
		end

		@posts = Post.all
	end

	def new_post
		current_user

		if @current_user
			@post = Post.new
		else
			redirect_to '/'
		end
	end

	def save_post
		current_user

		if @current_user
			@post = Post.new

			@post.title = params[:post][:title]
			@post.content = params[:post][:content]
			@post.user_id = @current_user.id

			@post.save

			redirect_to @post
		else
			redirect_to '/'
		end

	end
end
