def my_dup_finder(array)
  count = Hash.new(0)
  duplicates = []
  array.each do |word|
    count[word] += 1
    if count[word] == 2
      p count[word]
      duplicates << word
    end
  end
  duplicates
end
