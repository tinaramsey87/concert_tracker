require('spec_buddy')

describe(Venue) do
  it { should have_and_belong_to_many :bands }

  it('validates the presence of name') do
    band = Band.new({ :name => "" })
    expect(band.save).to(eq(false))
  end
end


# set up scope to see if band already has this venue listed and do not display in choices for that band
