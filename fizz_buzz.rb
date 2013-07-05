class FizzBuzz
  attr_reader :vals

  def initialize values=Array(1..100)
    @vals = [*values]
    raise ArgumentError unless valid?
  end

  def to_fizzbuzz
    @vals.map do |item|
      fizz = (item.remainder 3).zero?
      buzz = (item.remainder 5).zero?
      
      unless fizz || buzz
        item
      else
        "#{'Fizz' if fizz}#{'Buzz' if buzz}"
      end
    end
  end

  def show
    puts self.to_fizzbuzz.join(', ')
  end

  private
  def valid?
    res = @vals.all?{|item| item.respond_to?(:remainder) }
  end
end