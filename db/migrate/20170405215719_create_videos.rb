class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :video_file
      t.integer :likes, default: 0
      t.timestamps
    end
  end
end
