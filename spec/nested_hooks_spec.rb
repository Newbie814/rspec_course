RSpec.describe 'nested hooks' do
  before(:context) do
    puts 'Before OUTER context'
  end
  before(:example) do
    puts 'Before OUTER example'
  end

  it 'does basic math' do
    expect(1 + 1).to eq(2)
  end

  context 'with condition A' do
    before(:context) do
      puts 'Before INNER context'
    end
    before(:example) do
      puts 'Before INNER example'
    end
    it 'does some more basic math' do
      expect(1 + 1).to eq(2)
    end
  end
end