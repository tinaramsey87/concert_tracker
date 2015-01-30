class Band < ActiveRecord::Base
  validates :name, :presence => true

  has_and_belongs_to_many(:venues)
end
