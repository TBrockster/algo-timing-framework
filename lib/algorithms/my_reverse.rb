def my_reverse(array)
  i = 1
  reversed_array = []
  array.each do |x|
    reversed_array[array.length - i] = x
    i += 1
  end
  reversed_array
end

x = 99

y = (x / 20).round
z = x / 20

p y
p z
