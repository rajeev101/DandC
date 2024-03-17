class PasswordResetsController < ApplicationController
	def new
	end

	def create
    account = Account.find_by(email: params[:email])
    if account
      account.generate_password_reset_token
      UserMailer.password_reset_instructions(account).deliver_now
      redirect_to login_path, notice: 'Password reset instructions sent.'
    else
      flash.now[:alert] = 'Email address not found.'
      render :new
    end
  end


	def edit
    @account = Account.find_by(password_reset_token: params[:token])
    if @account.nil? || @account.password_reset_token_expired?
      redirect_to forgot_password_path, alert: 'Invalid or expired token.'
    end
  end


	def update
		@account = Account.find_by(password_reset_token: params[:token])
		if @account.update(account_params)
			@account.clear_password_reset_token
			session[:account_id] = @account.id
			redirect_to root_path, notice: 'Password has been reset.'
		else
			render :edit
		end
	end

	private

	def account_params
		params.require(:account).permit(:password, :password_confirmation)
	end
end
