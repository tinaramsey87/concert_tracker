require('spec_buddy')

describe(Band) do
  it { should have_and_belong_to_many :venues }

  it('validates the presence of name') do
    band = Band.new({ :name => "" })
    expect(band.save).to(eq(false))
  end

  it('validates the presence of name when updating') do
    band = Band.new({ :name => "Oomblik" })
    expect(band.update({ :name => ""})).to(eq(false))
  end

  it('validates that the band name is not already in the lsit') do
    band1 = Band.create({ :name => "Rush" })
    band2 = Band.create({ :name => "Rush" })
    expect(band1.save).to(eq(true))
    expect(band2.save).to(eq(false))
  end

  describe("#capitalize_name") do
    it('checks that band names start with capital letters') do
      band = Band.new({ :name => "rush" })
      band.save
      expect(band.name).to(eq("Rush"))
    end
  end
end
