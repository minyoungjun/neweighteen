class CreateFbvideos < ActiveRecord::Migration
  def change
    create_table :fbvideos do |t|
      t.string  :video_id
      t.string  :url
      t.integer :category_id
      t.boolean :hided, default: false
      t.integer :sort_number

      t.timestamps null: false
    end
    add_index :fbvideos, :url, unique: true
  end
end
