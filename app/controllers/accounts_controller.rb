class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      session[:account_id] = @account.id
      redirect_to root_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  private

  def account_params
    params.permit(:email, :password, :password_confirmation)
  end
end
