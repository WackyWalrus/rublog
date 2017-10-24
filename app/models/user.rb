class User < ApplicationRecord
	has_secure_password

	validates :email, :password, presence: true
	validates_confirmation_of :password
end