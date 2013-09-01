class CreateSessionRooms < ActiveRecord::Migration
  def change
    create_table :session_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
