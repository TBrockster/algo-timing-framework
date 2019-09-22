# algo-timing-framework

# Warning - Do not shuffle with more than ~3 steps

This Framework is intended to be able to time different algorithms and compare their efficieny, in an effort to write as simple algorithms as possible.

## Usage Instructions

 - git clone https://github.com/TBrockster/algo-timing-framework.git
 - cd algo-timing-framework
 - Run the timer.rb file (ruby ./lib/timer.rb)
 - Copy results from the algo-timer-results.csv
 - Paste into cell A3 on a copy of the following spreadsheet - https://docs.google.com/spreadsheets/d/1fbEJjvQzfriMHR56odUc8tOGI-K08viGZpiBTVPj7cI/edit?usp=sharing

### To do
 - Rework shuffle so it can be tested with more steps, ideally at least 20
 - Write more algorithms to test - https://github.com/makersacademy/course/blob/master/algorithmic_complexity/exercises.md
 - Smooth out curves
   - Use average of many trials (20..100)
   - Discard top and bottom 5% from averages