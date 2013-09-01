require "spec_helper"

describe SessionRoom do
  it 'requires room name to be declared' do
    room = SessionRoom.new
    expect { room.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'creates single room successfully' do
    room = SessionRoom.create!(:name => "Room 1")
    expect(SessionRoom.last).to eq(room)
  end
end
