require "spec_helper"

describe Session do
  it 'requires title to be declared' do
    speaker = Speaker.new firstname: "Jackson", lastname: "Harms", email: "jackson@blendisimo.com"
    speaker.save!
    session = Session.new( speaker: speaker )
    expect { session.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'requires speaker to be declared' do
    session = Session.new( title: "Test Sesion" )
    expect { session.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  it 'makes sure that summary does not change abstract' do
    abstract = 'Blah blah blubeaul bilibili bla. Bla bilbbla balibali blabl bloo blah blah. Bla blibalbul bailubal blablu
    balibali balbil. Blabla bilbul bla bla bloo bilbul blabla. Bli bla bla belbula balbal blah blah bilbbla. Belbula bla
    bulbool bailubal bailubal blabla. Blabl bla bulbool bloo balbil blabla. Blibalbul blabla blubeaul balbil bilbul balbal,
    blabl bla bla blah blah bailubal blablu bala. Bilibili balbil blablu blah blah blabla blubeaul. Blubeaul blah blah bla
    bla bulbool bilbbla blah blah balbal blabla bla bla.'

    speaker = Speaker.new firstname: "Jackson", lastname: "Harms", email: "jackson@blendisimo.com"
    speaker.save!
    session = Session.create!( title: "Test Session", speaker: speaker, abstract: abstract )
    # Make sure that we did not overwrite abstract with summary
    expect(session.summary).to_not eq(session.abstract)
    # Make sure that summary has the right number of characters
    expect(session.summary.length).to eq(143)
  end
  it 'creates single session successfully' do
    speaker = Speaker.new firstname: "Jackson", lastname: "Harms", email: "jackson@blendisimo.com"
    speaker.save!
    session = Session.create!( title: "Test Session", speaker: speaker )
    expect(Session.last).to eq(session)
  end
end
