class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :logo
      t.string :level
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
