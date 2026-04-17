class AddIconUrlToLinks < ActiveRecord::Migration[8.1]
  def change
    add_column :links, :icon_url, :string
  end
end
