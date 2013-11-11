class AddDeckToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :speaker_deck, :string
  end
end
