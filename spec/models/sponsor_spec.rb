require "spec_helper"

describe Sponsor do
  it 'requires title to be declared' do
    sponsor = Sponsor.new
    expect { sponsor.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'validates sponsor level properly' do
    sponsor = Sponsor.new(:name => "Blend Interactive", :level => 'Diamond')
    expect { sponsor.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
    sponsor = Sponsor.create!(:name => "Blend Interactive", :level => 'Gold')
    expect(Sponsor.last).to eq(sponsor)
    sponsor = Sponsor.create!(:name => "Blend Interactive", :level => 'Silver')
    expect(Sponsor.last).to eq(sponsor)
    sponsor = Sponsor.create!(:name => "Blend Interactive", :level => 'Bronze')
    expect(Sponsor.last).to eq(sponsor)
  end
  it 'creates single sponsor successfully' do
    sponsor = Sponsor.create!(:name => "Blend Interactive")
    expect(Sponsor.last).to eq(sponsor)
  end
end
