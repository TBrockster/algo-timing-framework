require 'benchmark'
require 'csv'

def timer(steps)
  results = {}
  (1..steps).each do |step|
    n = step * 5_000
    array = * (1..n).map { rand }
    results[n] = timefunction(array)
  end
  save_to_csv(results)
end

def timefunction(array)
  start_time = Time.now
  array.dup.sort
  end_time = Time.now
  start_time - end_time
end

def save_to_csv(results, filename = 'algo-timer-results.csv')
  CSV.open(filename, 'w') do |csv|
    results.each do |key, value|
      csv << [key, value]
    end
  end
  puts 'File Saved'
end

timer(20)
