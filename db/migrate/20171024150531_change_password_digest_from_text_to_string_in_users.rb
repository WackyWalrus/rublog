class ChangePasswordDigestFromTextToStringInUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :password_digest, :string
  	change_column :users, :password, :string
  end
end
