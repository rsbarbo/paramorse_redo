require 'pry'

class Queue

  def initialize
    @list = Array.new
  end

  def count
    @list.count
  end

  def push(digit)
    @list << digit
  end

  def tail(*number)
    if number.length > 0
      @list[(number.first * -1)..-1].reverse
    else
      @list.last
    end
  end

  def peek(*number)
    if number.length > 0
      @list[0..(number.first - 1)]
    else
      @list.first
    end
  end

  def pop_by_another_name(*number) #got an error when this was just pop.
    if number.length > 0
      @list.pop(number.first)
    else
      @list.pop
    end
  end

  def clear
    @list.clear
  end
end
