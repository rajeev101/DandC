class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # private

  # def authenticate_user!
  #   token = request.headers['Authorization']
  #   if token.nil?
  #     render json: { error: 'Authorization header missing' }, status: :unauthorized
  #     return
  #   end

  #   begin
  #     decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
  #     @current_user = User.find(decoded_token[0]['user_id'])
  #   rescue JWT::DecodeError => e
  #     render json: { error: 'Invalid token' }, status: :unauthorized
  #   rescue ActiveRecord::RecordNotFound => e
  #     render json: { error: 'User not found' }, status: :unauthorized
  #   end
  # end
end

