class CreateSessionTimes < ActiveRecord::Migration
  def change
    create_table :session_times do |t|
      t.time :time

      t.timestamps
    end
  end
end
