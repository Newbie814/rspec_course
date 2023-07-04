RSpec.describe Hash do
  it 'should start off empty' do
    puts subject 
    puts subject.class
    expect(subject.length).to eq(0)
  end
end