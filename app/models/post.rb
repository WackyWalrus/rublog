class Post < ApplicationRecord
	belongs_to :user
	has_many :views

	def url
		"/posts/#{self.id}"
	end

	def view (ip)
		@view = View.find_by post_id: self.id, ip: ip

		if @view === nil
			@view = View.new
			@view.ip = ip
			@view.post_id = self.id
			@view.save
		end
	end
end
