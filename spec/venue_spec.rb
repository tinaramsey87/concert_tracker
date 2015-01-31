require('spec_buddy')

describe(Venue) do
  it { should have_and_belong_to_many :bands }

  it('validates the presence of name') do
    venue = Venue.new({ :name => "" })
    expect(venue.save).to(eq(false))
  end

  describe(".not_played") do
    it("returns only the venues at which a band has not yet played") do
      not_played_venue1 = Venue.create({:name => "Hawthorne Theater", :played => false})
      not_played_venue2 = Venue.create({:name => "Roseland", :played => false})
      not_played_venues = [not_played_venue1, not_played_venue2]
      played_venue = Venue.create({:name => "Goodfoot", :played => true})
      expect(Venue.not_played()).to(eq(not_played_venues))
    end
  end
end
