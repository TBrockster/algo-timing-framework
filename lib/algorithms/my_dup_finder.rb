def my_dup_finder(array)
  count = Hash.new(0)
  duplicates = []
  array.each do |word|
    count[word] += 1
    duplicates << word if count[word] == 2
  end
  duplicates
end
