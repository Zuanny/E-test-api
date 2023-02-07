class CreateVideoRoomUser < ActiveRecord::Migration[7.0]
  def change
    create_table :video_room_users do |t|
      t.date :login_date
      t.references :user , null: false, foreign_key: true
      t.references :video_rooms , null: false, foreign_key: true
      t.timestamps
    end
  end
end
