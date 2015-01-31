class RemoveColumnFromBandsVenues < ActiveRecord::Migration
  def change
    remove_column(:bands_venues, :played, :boolean)

    add_column(:venues, :played, :boolean)
  end
end
