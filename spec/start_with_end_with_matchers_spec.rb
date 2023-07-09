RSpec.describe 'start_with and end_with matchers' do
  describe 'caterpillar' do
    it 'should check for a substring at the beginning or end' do
      expect(subject).to start_with('cat')
      expect(subject).to end_with('pillar')
    end
  end

  it { is_expected.to start_with('cat') }
  it { is_expected.to end_with('pillar') }
end