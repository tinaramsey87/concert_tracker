class Band < ActiveRecord::Base
  validates :name, :presence => true
  before_save(:capitalize_name)
  before_create(:check_exists)
  has_and_belongs_to_many(:venues)

  define_method(:capitalize_name) do
    self.name=(name.capitalize)
  end

  define_method(:check_exists) do
    if
    Band.exists?({ :name => self.name })
    self.update
    else
      self.save
    end
  end
end
