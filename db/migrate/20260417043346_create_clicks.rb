class CreateClicks < ActiveRecord::Migration[8.1]
  def change
    create_table :clicks do |t|
      t.references :link, null: false, foreign_key: true
      t.string :ip
      t.string :user_agent

      t.timestamps
    end
  end
end
