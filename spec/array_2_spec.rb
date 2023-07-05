RSpec.describe Array do
  subject(:sally) do
    [1, 2]
  end

  it 'has two key-value pairs' do
    expect(sally.length).to eq(2)
    sally.pop
    expect(sally.length).to eq(1)
  end

end