require 'benchmark'
require 'csv'

def timer(steps)
  results = {}
  (1..steps).each do |step|
    n = step * 5_000
    array = * (1..n).map { rand }
    algo_time = Benchmark.realtime do
      array.dup.last
    end
    results[n] = algo_time
  end
  save_students(results)
end

def save_students(filename = 'algo-timer-results.csv', results)
  CSV.open(filename, 'w') do |csv|
    results.each do |key, value|
      csv << [key, value]
    end
  end
  puts 'File Saved'
end

timer(20)
