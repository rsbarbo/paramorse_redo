require 'pry'

module ParaMorse

  class Queue

    def initialize
      @queue = Array.new
    end

    def count
      @queue.count
    end

    def push(digit)
      @queue << digit
    end

    def tail(*number)
      if number.length > 0
        @queue[(number.first * -1)..-1].reverse
      else
        @queue.last
      end
    end

    def peek(*number)
      if number.length > 0
        @queue[0..(number.first - 1)]
      else
        @queue.first
      end
    end

    def pop(*number)
      if number.length > 0
        @queue.pop(number.first)
      else
        @queue.pop
      end
    end

    def clear
      @queue.clear
    end
  end

end
