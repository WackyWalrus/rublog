class DropPasswordConfirmationAddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :password_confirmation, :text
  	add_column :users, :password_digest, :text
  end
end
