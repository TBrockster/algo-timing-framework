require 'my_reverse'

describe 'my_reverse' do
  it 'reverses a simple array' do
    expect(my_reverse([1, 2])).to eq([2, 1])
  end
end