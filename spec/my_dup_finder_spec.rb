require_relative '../lib/algorithms/my_dup_finder'

describe 'my_dup_finder' do
  it 'when given an array, returns an array containing all duplicates' do
    expect(my_dup_finder(%w[hello world hello friend])).to eq(%w[hello])
  end
  it 'when given a different array, returns an array containing all duplicates' do
    expect(my_dup_finder(%w[the the house])).to eq(%w[the])
  end
end
