class PostSerializer < ActiveModel::Serializer
  attributes :id,:attchment, :user_id, :created_at,:updated_at,:profile,
  :likes_count,:comments_count,:user

  attribute :recently_joined? do |ssd|
  	Date.today.prev_month<object.created_at
  end

  attribute :profile do |ssd|
    if object.profile.attached? 
      { id:  object.profile.id,
        content_type: object.profile.content_type,
        url: ENV['BASE_URL'] + Rails.application.routes.url_helpers.rails_blob_url(object.profile, only_path: true) 
      }
     else
      false
    end
  end

  def likes_count
    object.likes.count
   end
  
  def comments_count
    object.comments.count
  end  

    def user
    object.user

    end


end
