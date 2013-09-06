require "spec_helper"

describe Subscriber do
  it 'requires name to be declared' do
    subscriber = Subscriber.new(email: 'tyler@example.com')
    expect { subscriber.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'requires email to be declared' do
    subscriber = Subscriber.new(name: 'Tyler Harms')
    expect { subscriber.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'creates subscriber successfully' do
    subscriber = Subscriber.create!(name: 'Tyler Harms', email: 'tyler@example.com')
    expect(Subscriber.last).to eq(subscriber)
  end
end
