class AppController < ApplicationController
	include UsersHelper

	def startup
		if User.count > 0
			render "index"
		else
			redirect_to users_new_url
		end
	end
end
