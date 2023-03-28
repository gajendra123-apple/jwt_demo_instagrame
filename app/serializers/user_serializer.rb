class UserSerializer < ActiveModel::Serializers
   attributes :id,:email, :password,:name,:user_name ,:profile ,:recently_joined?


  # attribute :recently_joined? do |ssd|
    # Date.today.prev_month < object.created_at
  # end

  # attribute :profile do |ssd|
    # if object.profile.attached? 
    #   { id: object.profile.id,
    #     content_type: object.profile.content_type,
    #     url: ENV['BASE_URL'] + Rails.application.routes.url_helpers.rails_blob_url(object.profile, only_path: true) 
    #   }
    # else
    #   false
    # end
  # end
end
