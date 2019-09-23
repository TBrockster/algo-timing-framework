Dir[File.join(__dir__, 'algorithms', '*.rb')].each { |file| require file }
require 'csv'

class AlgoTimer
  STEPS = 20
  STEP_SIZE = 5_000
  NUMBER_OF_WARM_UPS = 10
  NUMBER_OF_RUNS = 100

  def run
    @results = {}
    warm_up
    time_algorithm_runner
    average_results
    save_results
  end

  private

  def warm_up
    puts '---Warm ups---'
    (1..NUMBER_OF_WARM_UPS).each do |warm_up|
      puts "Warm up: #{warm_up}"
      generate_array(1)
      run_algorithm
    end
    puts '---Warm ups complete---'
  end

  def generate_array(step)
    array_size = step * STEP_SIZE
    @test_array = * (1..array_size).map { rand }
  end

  def run_algorithm
    my_dup_finder(@test_array)
  end

  def time_algorithm_runner
    puts '---Timing algorithm---'
    (1..NUMBER_OF_RUNS).each do |run|
      (1..STEPS).each do |step|
        puts "Run: #{run}, Step: #{step}"
        generate_array(step)
        run_time = time_algorithm
        record_result(step, run_time)
      end
    end
    puts '---Timing algorithm complete---'
  end

  def time_algorithm
    start_time = Time.now
    run_algorithm
    Time.now - start_time
  end

  def record_result(step, run_time)
    if @results[step * STEP_SIZE] == true
      @results[step * STEP_SIZE] << run_time
    else
      @results[step * STEP_SIZE] = [run_time]
    end
  end

  def average_results
    @results.each do |key, _value|
      @results[key] = (@results[key].sum / @results[key].length)
    end
  end

  def save_results(filename = 'algo-timer-results.csv')
    CSV.open(filename, 'w') do |csv|
      @results.each do |key, value|
        csv << [key, value]
      end
    end
    puts 'File Saved'
  end
end

my_algo_timer = AlgoTimer.new
my_algo_timer.run
