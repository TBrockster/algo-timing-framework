def my_reverse(array)
  i = 1
  reversed_array = []
  array.each do |x|
    reversed_array[array.length - i] = x
    i += 1
  end
  reversed_array
end
