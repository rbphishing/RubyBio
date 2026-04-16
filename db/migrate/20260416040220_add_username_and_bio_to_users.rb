class AddUsernameAndBioToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :username, :string unless column_exists?(:users, :username)
    add_column :users, :bio, :text unless column_exists?(:users, :bio)
  end
end
