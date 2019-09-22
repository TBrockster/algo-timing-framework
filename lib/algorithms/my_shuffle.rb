def my_shuffle(array)
  y = []
  results = [0] * array.length
  until y.length == array.length
    y << rand(0..array.length - 1)
    y.uniq!
  end
  counter = 0
  array.each do |value|
    results[y[counter]] = value
    counter += 1
  end
end
