require 'simplecov'
SimpleCov.start

require './fizz_buzz'
require 'stringio'

describe 'FizzBuzz' do
  
  describe "initialization" do
    it "should accept collection of numbers" do
      ->{ FizzBuzz.new (1..10).to_a }.should_not raise_exception
    end

    it "should accept a single number" do
      ->{ FizzBuzz.new 0 }.should_not raise_exception
    end

    it "should init values with Array from 1 to 100 by default" do
      FizzBuzz.new.vals.should be_eql(Array(1..100))
    end

    it "should not accept non-numbers" do
      ->{ FizzBuzz.new ['one', 'two', 'three'] }.should raise_exception(ArgumentError)
    end
  end

  describe "#to_fizzbuzz" do
    fizz_nums = [3, 6, 9, 12]
    buzz_nums = [5, 10, 20, 25]
    fizzbuzz_nums = Array.new(4) {rand(10) * 15}
    pure_nums = [1, 2, 4, 7]

    pure_nums.each do |num|
      it "should return #{num} for #{num}" do
        FizzBuzz.new(num).to_fizzbuzz.should == [num]
      end
    end
    buzz_nums.each do |num|
      it "should return Buzz for #{num}" do
        FizzBuzz.new(num).to_fizzbuzz.should == ["Buzz"]
      end
    end
    fizz_nums.each do |num|
      it "should return Fizz for #{num}" do
        FizzBuzz.new(num).to_fizzbuzz.should == ["Fizz"]
      end
    end
    fizzbuzz_nums.each do |num|
      it "should return FizzBuzz for #{num}" do
        FizzBuzz.new(num).to_fizzbuzz.should == ["FizzBuzz"]
      end
    end
  end

  describe "#show" do
    let(:fizz_buzz) { FizzBuzz.new }

    it "should use #to_fizzbuzz data" do
      fizz_buzz.should_receive(:to_fizzbuzz).and_return([])
      fizz_buzz.show
    end

    it "should print values" do
      STDOUT.should_receive(:puts).with(fizz_buzz.to_fizzbuzz.join(', '))
      fizz_buzz.show
    end
  end
end