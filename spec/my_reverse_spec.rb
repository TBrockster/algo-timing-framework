require_relative '../lib/algorithms/my_reverse'

describe 'my_reverse' do
  it 'reverses a simple array' do
    expect(my_reverse([1, 2])).to eq([2, 1])
  end
  it 'reverses a different simply array' do
    expect(my_reverse(%w[a b])).to eq(%w[b a])
  end
  it 'matches the inbuilt .reverse method for complex arrays' do
    test_array = * (1..5000).map { rand }
    expect(my_reverse(test_array)).to eq(test_array.reverse)
  end
end
