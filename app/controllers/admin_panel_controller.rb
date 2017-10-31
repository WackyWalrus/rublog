class AdminPanelController < ApplicationController
	include UsersHelper

	# GET
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

	def account
		if check_for_user
			current_user
		end
	end

	def users
		if check_for_user

		end
	end

	def settings
		if check_for_user
			@data = DataParent.find(1)
		end
	end

	# POST
	def save_post
		if check_for_user
			current_user

			@post = Post.new

			@post.title = params[:post][:title]
			@post.content = params[:post_content][:content]
			@post.user_id = @current_user.id

			@post.save

			redirect_to edit_post_admin_panel_url id: @post.id, message: 'Post saved!'
		end
	end

	# PATCH
	def update_post
		if check_for_user
			current_user

			@post = Post.find(params[:id])

			@post.title = params[:post][:title]
			@post.content = params[:post][:content]

			@post.save

			redirect_to edit_post_admin_panel_url id: @post.id, message: 'Post saved!'
		end
	end

	# DELETE
	def delete_post
		if check_for_user
			Post.find(params[:id]).destroy

			redirect_to posts_admin_panel_url
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
