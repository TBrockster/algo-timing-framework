Dir[File.join(__dir__, 'algorithms', '*.rb')].each { |file| require file }
require 'csv'

# this is a WIP algorithm timing framework
class AlgoTimer
  STEPS = 20
  STEP_SIZE = 5_000
  NUMBER_OF_WARM_UPS = 10
  NUMBER_OF_RUNS = 100

  def initialize(steps: STEPS,
                 step_size: STEP_SIZE,
                 number_of_warm_ups: NUMBER_OF_WARM_UPS,
                 number_of_runs: NUMBER_OF_RUNS)
    @steps = steps
    @step_size = step_size
    @number_of_warm_ups = number_of_warm_ups
    @number_of_runs = number_of_runs
  end

  def run
    begin_time = Time.now
    @results = {}
    warm_up
    time_algorithm
    smooth_results
    save_results
    end_time = Time.now - begin_time
    puts "Total time taken: #{end_time}s"
  end

  private

  def warm_up
    puts '---Warm ups---'
    (1..@number_of_warm_ups).each do |warm_up|
      puts "Warm up: #{warm_up}"
      generate_array(1)
      run_algorithm
    end
    puts '---Warm ups complete---'
  end

  def generate_array(step)
    array_size = step * @step_size
    @test_array = * (1..array_size).map { rand }
  end

  def run_algorithm
    my_dup_finder(@test_array)
  end

  def time_algorithm
    puts '---Timing algorithm---'
    (1..@number_of_runs).each do |run|
      (1..@steps).each do |step|
        puts "Run: #{run}, Step: #{step}"
        generate_array(step)
        run_time = algorithm_duration
        record_result(step, run_time)
      end
    end
    puts '---Timing algorithm complete---'
  end

  def algorithm_duration
    start_time = Time.now
    run_algorithm
    Time.now - start_time
  end

  def record_result(step, run_time)
    if @results[step * @step_size].nil?
      @results[step * @step_size] = [run_time]
    else
      @results[step * @step_size] << run_time
    end
  end

  def smooth_results
    remove_outliers
    average_results
  end

  def remove_outliers
    @results.each do |key, value|
      (1..@number_of_runs / 5).each do
        @results[key].delete(value.max)
        @results[key].delete(value.min)
      end
    end
  end

  def average_results
    @results.each do |key, value|
      @results[key] = (value.sum / value.length)
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
