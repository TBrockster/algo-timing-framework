Dir[File.join(__dir__, 'algorithms', '*.rb')].each { |file| require file }
require 'csv'

STEP_SIZE = 5_000
NUMBER_OF_WARM_UPS = 10
NUMBER_OF_RUNS = 20

def algo_timer(steps)
  results = Hash.new(0)
  NUMBER_OF_RUNS.times do
    (1..steps).each do |step|
      array_size = step * STEP_SIZE
      test_array = * (1..array_size).map { rand }
      results[array_size] += time_algorithm(test_array)
    end
  end
  results.each do |key, _value|
    results[key] /= NUMBER_OF_RUNS
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
  NUMBER_OF_WARM_UPS.times do
    array_dup = array.dup
    run_algorithm(array_dup)
  end
end

def run_algorithm(array)
  my_dup_finder(array)
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
