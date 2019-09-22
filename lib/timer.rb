require 'benchmark'
require 'csv'
require_relative './my_reverse'
require_relative './my_shuffle'

def algo_timer(steps)
  results = {}
  (1..steps).each do |step|
    array_size = step * 5_000
    test_array = * (1..array_size).map { rand }
    results[array_size] = time_algorithm(test_array)
  end
  save_to_csv(results)
end

def time_algorithm(array)
  warm_up(array)
  array_dup = array.dup
  start_time = Time.now
  run_algorithm(array_dup)
  Time.now - start_time
end

def warm_up(array)
  50.times do
    array_dup = array.dup
    run_algorithm(array_dup)
  end
end

def run_algorithm(array)
  my_reverse(array)
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
