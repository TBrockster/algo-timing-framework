require 'benchmark'

def timer(steps)
  results = {}
  (1..steps).each do |step|
    n = step * 5_000
    array = * (1..n).map { rand }
    algo_time = Benchmark.realtime do
      array.dup.last
    end
    results[n] = [algo_time]
  end
  results.each do |result|
    puts result
  end
end

timer(20)
