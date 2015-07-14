class CreateFbvideos < ActiveRecord::Migration
  def change
    create_table :fbvideos do |t|
      t.string  :video_id
      t.string  :url
      t.integer :category_id
      t.timestamps null: false
    end
    add_index :fbvideos, :url, unique: true
  end
end
