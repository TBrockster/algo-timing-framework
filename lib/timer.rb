require 'benchmark'
require 'csv'
require_relative './my_reverse'

def algo_timer(steps)
  results = {}
  (1..steps).each do |step|
    array_size = step * 5_000
    test_array = * (1..array_size).map { rand }
    results[array_size] = timefunction(test_array)
  end
  save_to_csv(results)
end

def timefunction(array)
  start_time = Time.now
  my_reverse(array.dup)
  start_time - Time.now
end

def save_to_csv(results, filename = 'algo-timer-results.csv')
  CSV.open(filename, 'w') do |csv|
    results.each do |key, value|
      csv << [key, value]
    end
  end
  puts 'File Saved'
end

algo_timer(20)
