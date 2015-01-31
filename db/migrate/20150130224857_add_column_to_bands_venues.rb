class AddColumnToBandsVenues < ActiveRecord::Migration
  def change
    add_column(:bands_venues, :played, :boolean)
  end
end
