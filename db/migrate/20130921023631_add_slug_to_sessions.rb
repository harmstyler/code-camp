class AddSlugToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :slug, :string
  end
end
