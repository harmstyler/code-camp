require "spec_helper"

describe SessionTime do
  it 'requires time to be declared' do
    time = SessionTime.new
    expect { time.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'creates times successfully' do
    time = SessionTime.create!(:time => "08:00:00.000000")
    expect(SessionTime.last).to eq(time)
  end
end
