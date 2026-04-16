class AddActiveToLinks < ActiveRecord::Migration[8.1]
  def change
    add_column :links, :active, :boolean
  end
end
