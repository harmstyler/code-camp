require "spec_helper"

describe Sponsor do
  it 'requires title to be declared' do
    sponsor = Sponsor.new
    expect { sponsor.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'creates single sponsor successfully' do
    sponsor = Sponsor.create!(:name => "Blend Interactive")
    expect(Sponsor.last).to eq(sponsor)
  end
end
