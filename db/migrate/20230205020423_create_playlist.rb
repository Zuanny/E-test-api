class CreatePlaylist < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :link
      t.string :status
      t.references :user , null: false, foreign_key: true
      t.references :video_rooms , null: false, foreign_key: true
      t.timestamps
    end
  end
end
