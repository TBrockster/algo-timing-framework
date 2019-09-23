def my_shuffle(array)
  shuffled_array = (1..array.length).map do
    temp = rand(0..(array.length - 1))
    array[temp]
    array.delete_at(temp)
  end
end
