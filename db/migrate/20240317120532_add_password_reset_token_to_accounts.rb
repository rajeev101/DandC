class AddPasswordResetTokenToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :password_reset_token, :string
  end
end
