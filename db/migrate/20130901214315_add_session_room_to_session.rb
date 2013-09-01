class AddSessionRoomToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :session_room_id, :integer
  end
end
