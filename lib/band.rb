class Band < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true
  before_save(:capitalize_name)
  has_and_belongs_to_many(:venues)

  define_method(:capitalize_name) do
    band_name_words = []
    words = self.name.downcase.split(" ")
    words.each do |word|
      band_name_words.push(word.capitalize!)
    end
    self.name = band_name_words.join(" ")
  end
end
