require 'benchmark'

def timer(algorithm, array)
    array.shuffle
    algorithm_time = Benchmark.realtime do
        array.sort
    end
    puts algorithm_time
end

timer(1, [1,2,3])