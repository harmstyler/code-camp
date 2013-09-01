class AddSessionTimeToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :session_time_id, :integer
  end
end
