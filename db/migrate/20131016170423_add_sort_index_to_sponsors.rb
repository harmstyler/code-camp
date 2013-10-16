class AddSortIndexToSponsors < ActiveRecord::Migration
  def up
    add_column :sponsors, :sort_index, :integer
    add_index :sponsors, :sort_index, { name: 'sponsor_sort_index', unique: true, order: { sort_index: :asc } }
  end
  def down
    remove_column :sponsors, :sort_index
  end
end
