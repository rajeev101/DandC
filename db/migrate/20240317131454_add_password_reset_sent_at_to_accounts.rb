class AddPasswordResetSentAtToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :password_reset_sent_at, :datetime
  end
end
