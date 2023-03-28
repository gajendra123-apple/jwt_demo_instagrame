class CommentSerializer < ActiveModel::Serializer
  attributes :id,:text, :user_id, :post_id, :created_at, :updated_at, :reply

  attribute :attch do |ssd|
    if object.attch.attached? 
      { id: object.attch.id,
        content_type: object.attch.content_type,
        url: ENV['BASE_URL'] + Rails.application.routes.url_helpers.rails_blob_url(object.attch, only_path: true) 
      }
     else
      false
    end
  end

  attribute :reply do |ssd|
    object.replies
  end
end
