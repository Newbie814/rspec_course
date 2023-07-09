# falsy values --- false, nil

RSpec.describe 'be matcher' do
  it 'can be used for truthiness' do
    expect(true).to be_truthy
    expect('Hello').to be_truthy
    expect(5).to be_truthy
    expect(0).to be_truthy
    expect(-1).to be_truthy
    expect([]).to be_truthy
    expect({}).to be_truthy
    expect(:symbol).to be_truthy
  end

  it 'can be used for falsiness' do
    expect(false).to be_falsy
    expect(nil).to be_falsy
    expect(0).not_to be_falsy
  end
end