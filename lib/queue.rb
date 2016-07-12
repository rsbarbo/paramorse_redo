module ParaMorse

  class Queue
    attr_accessor :queue

    def initialize
      @queue = Array.new
    end

    def push(*element)
      element.map do |e|
        queue.unshift(e.upcase)
      end
      queue
    end

    def count
      queue.size
    end

    def peek(index = nil)
      return queue.last if index == nil
      queue[-index .. - 1]
    end

    def pop(number = nil)
      return queue.pop if number == nil
      queue.pop(number)
    end

    def tail(index = nil)
      return queue.first if index == nil
      queue.take(index)
    end

    def clear
      queue.clear
    end
  end

end
