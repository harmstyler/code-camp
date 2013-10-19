require "spec_helper"

describe Sponsor do
  it 'requires title to be declared' do
    sponsor = Sponsor.new
    expect { sponsor.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'validates sponsor level properly' do
    sponsor = Sponsor.new(:name => "Blend Interactive", :level => 'Diamond', sort_index: 0)
    expect { sponsor.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
    sponsor = Sponsor.create!(:name => "Blend Interactive", :level => 'Gold', sort_index: 10)
    expect(Sponsor.last).to eq(sponsor)
    sponsor = Sponsor.create!(:name => "Blend Interactive", :level => 'Silver', sort_index: 20)
    expect(Sponsor.last).to eq(sponsor)
    sponsor = Sponsor.create!(:name => "Blend Interactive", :level => 'Bronze', sort_index: 30)
    expect(Sponsor.last).to eq(sponsor)
  end
  it 'creates single sponsor successfully' do
    sponsor = Sponsor.create!(:name => "Blend Interactive", sort_index: 40)
    expect(Sponsor.last).to eq(sponsor)
  end
end
