class Venue < ActiveRecord::Base
  scope(:not_played, lambda do
    where({:played => false})
  end)
  

  has_and_belongs_to_many(:bands)
  validates :name, :presence => true

end
