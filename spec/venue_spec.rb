require('spec_helper')

describe(Venue) do
  it{should validate_presence_of(:name)}
end
