class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy ,:counter_cache => true
	has_many :likes, dependent: :destroy, :counter_cache => true
	has_one_attached :profile
	


	
end
