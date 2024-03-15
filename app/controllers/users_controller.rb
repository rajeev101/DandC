class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:login, :signup, :forgot_password]
  skip_before_action :verify_authenticity_token


  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Generate JWT token
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def signup
     user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def forgot_password
    user = User.find_by(email: params[:email])
    if user 
      render json: { message: 'Password reset instructions sent to your email' }
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def generate_token(user)
    JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
  end
end
