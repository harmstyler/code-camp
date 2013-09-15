require "spec_helper"

describe SpeakerSubmission do
  it 'requires speaker name to be declared' do
    speaker = SpeakerSubmission.new(email: 'tyler@example.com', title: 'My Awesome Title', abstract: 'xkcd')
    expect { speaker.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'requires email to be declared' do
    speaker = SpeakerSubmission.new(name: 'Tyler', title: 'My Awesome Title', abstract: 'xkcd')
    expect { speaker.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'requires title to be declared' do
    speaker = SpeakerSubmission.new(name: 'Tyler', email: 'tyler@example.com', abstract: 'xkcd')
    expect { speaker.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'requires abstract to be declared' do
    speaker = SpeakerSubmission.new(name: 'Tyler', email: 'tyler@example.com', title: 'My Awesome Title')
    expect { speaker.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'creates speaker submission successfully' do
    speaker = SpeakerSubmission.create!(name: 'Tyler', email: 'tyler@example.com', title: 'My Awesome Title', abstract: 'xkcd', speaker_bio: 'asdf')
    expect(SpeakerSubmission.last).to eq(speaker)
  end
end
