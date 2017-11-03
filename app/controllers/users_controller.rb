class UsersController < ApplicationController
	include UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.new

		@user.email = params[:user][:email]
		@user.name = params[:user][:name]
		@user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]

		@user.save

		if @user.authenticate(params[:user][:password])
			session[:current_user] = {
				id: @user.id,
				email: @user.email
			}
		end

		redirect_to '/admin'
	end

	def update
		current_user

		if @current_user
			@user = User.find(@current_user.id)

			@user.email = params[:user][:email]
			@user.name = params[:user][:name]

			if params[:user][:password].length > 0
				@user.password = params[:user][:password]
				@user.password_confirmation = params
			end

			@user.save!

			redirect_to account_admin_panel_url
			return
		end

		redirect_to '/login'
	end

	def show_login
		reset_session
		@user = User.new
	end

	def do_login
		@user = User.find_by(email: params[:user][:email])

		if @user
			if @user.try(:authenticate, params[:user][:password])
				reset_session
				session[:current_user] = {
					id: @user.id,
					email: @user.email
				}
			end
		end

		redirect_to '/admin'
	end

	def do_logout
		reset_session

		redirect_to '/'
	end
end
