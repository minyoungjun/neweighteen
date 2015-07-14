class CreateTubes < ActiveRecord::Migration
  def change
    create_table :tubes do |t|

      t.string  :video_id
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :tubes, :video_id, unique: true
  end
end
