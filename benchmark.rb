require 'benchmark'
require './fizz_buzz'

n = 1000000
Benchmark.bm do |x|
  x.report { FizzBuzz.new(Array(1..100000)) }
  x.report { FizzBuzz.new(Array(1..100000)).to_fizzbuzz }
end