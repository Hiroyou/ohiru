class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.references :user
      t.string :url
      t.string :name
      t.string :thumbnail
      t.string :genre
      t.text :open_hours

      t.timestamps
    end
    add_index :restaurants, :user_id
  end
end
