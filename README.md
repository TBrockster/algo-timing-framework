# algo-timing-framework

This Framework is intended to be able to time different algorithms and compare their efficieny, in an effort to write as simple algorithms as possible.

## Usage Instructions

 - git clone https://github.com/TBrockster/algo-timing-framework.git
 - cd algo-timing-framework
 - Change the algorithm defined with the run_algorithm(array) method (line 50 of algo_timer.rb) to the algorithm you wish to time.
 - Run the timer.rb file (ruby ./lib/timer.rb)
 - Copy results from the algo-timer-results.csv
 - Paste into a copy of this [spreadsheet](https://docs.google.com/spreadsheets/d/1fbEJjvQzfriMHR56odUc8tOGI-K08viGZpiBTVPj7cI/edit?usp=sharing).

## Graphs

For all graphs, and raw data, see this [spreadsheet](https://docs.google.com/spreadsheets/d/1fbEJjvQzfriMHR56odUc8tOGI-K08viGZpiBTVPj7cI/edit?usp=sharing).

![Alt text](/screenshots/reverse_graph.png?raw=true "my_reverse vs .reverse")

![Alt text](/screenshots/shuffle_graph.png?raw=true "my_shuffle vs .shuffle")
</br><sub>N.B. .shuffle only appears constant due to the scale distortion caused by my much slower algorithm. It appears as a linear line, with a slight gradient when plotted alone.</sub>

![Alt text](/screenshots/dup_finder_graph.png?raw=true "my_dup_finder")

### To do
 - Write more algorithms to test - https://github.com/makersacademy/course/blob/master/algorithmic_complexity/exercises.md
 - Use SRand to test shuffle algorithm
