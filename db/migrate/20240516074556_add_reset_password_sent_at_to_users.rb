class AddResetPasswordSentAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_password_setn_at, :datetime
  end
end
