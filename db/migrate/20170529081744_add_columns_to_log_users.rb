class AddColumnsToLogUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :log_users, :provider, :string
    add_column :log_users, :uid, :string
    add_column :log_users, :username, :string
  end
end
