class User < ApplicationRecord
	has_many :posts, dependent: :destroy

	has_secure_password

	validates :email, presence: true
	validates :password, presence: true, on: :create
	validates_confirmation_of :password
end
