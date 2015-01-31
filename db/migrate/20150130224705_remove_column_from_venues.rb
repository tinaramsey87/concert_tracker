class RemoveColumnFromVenues < ActiveRecord::Migration
  def change
    remove_column(:venues, :played, :boolean)
  end
end
