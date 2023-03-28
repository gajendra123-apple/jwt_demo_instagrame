class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	# has_one_attached :profile
end




