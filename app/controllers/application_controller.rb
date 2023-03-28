class ApplicationController < ActionController::API
 
  include JwtToken
  before_action :authenticate_user
  # before_action :set_env_base_url

  private
  def set_env_base_url
    unless ENV['BASE_URL'].present?set_env_base_url.env
      ENV['BASE_URL'] = request.base_url
    end
  end

   def authenticate_user

    header = request.headers["Token"]
    header = header.split(" ").last if header
    begin 
       @decoded = jwt_decode(header)
       @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e 
       render json: {errors: e.message },status: :unauthorized
    rescue JWT::DecodeError => e 
       render json: {errors: e.message }, status: :unauthorized
     end
    end   	
end
