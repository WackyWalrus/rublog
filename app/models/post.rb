class Post < ApplicationRecord

	def url
		"/posts/#{self.id}"
	end
end
