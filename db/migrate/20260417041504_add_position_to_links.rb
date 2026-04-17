class AddPositionToLinks < ActiveRecord::Migration[8.1]
  def change
    add_column :links, :position, :integer
  end
end
