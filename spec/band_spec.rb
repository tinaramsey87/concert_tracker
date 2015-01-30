require('spec_buddy')

describe(Band) do
  it { should have_and_belong_to_many :venues }

end
