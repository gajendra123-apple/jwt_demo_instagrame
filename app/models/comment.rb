class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post,optional:true
	has_many :likes, dependent: :destroy 
	has_one_attached :attch
	belongs_to :comment, class_name: "Comment", foreign_key: "reply_id", optional: true
  	has_many :replies, class_name: "Comment", foreign_key: "reply_id"
end
