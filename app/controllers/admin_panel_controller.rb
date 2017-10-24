class AdminPanelController < ApplicationController
	include UsersHelper

	def index
		if check_for_user
			@posts = Post.all
		end
	end

	def new_post
		if check_for_user
			@post = Post.new
		end
	end

	def edit_post
		if check_for_user
			@post = Post.find(params[:id])
		end
	end

	def save_post
		if check_for_user
			current_user

			@post = Post.new

			@post.title = params[:post][:title]
			@post.content = params[:post][:content]
			@post.user_id = @current_user.id

			@post.save

			redirect_to @post
		end
	end

	private
		def check_for_user
			current_user

			if @current_user === false
				redirect_to '/users/login'
				return false
			else
				return true
			end
		end
end
