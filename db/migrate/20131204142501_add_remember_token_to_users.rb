class AddRememberTokenToUsers < ActiveRecord::Migration
	add_column :users, :remember_token, :string
    add_index  :users, :remember_token
end
