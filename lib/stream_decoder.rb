require "pry"

module ParaMorse

  class StreamDecoder
    attr_reader :words
    attr_accessor :queue, :word_decoder

    def initialize
      @queue = ParaMorse::Queue.new.queue
      @word_decoder = ParaMorse::Decoder.new
      @words = []
    end

    def receive(input)
      @queue.push(input)
    end

    def decode
      prepared = @queue.join
      variable = prepared.split("0000000").map do |word|
        word.split("000").map do |letter|
          letter.slice!(0) if letter.start_with?("0")
          letter.chop! if  letter.end_with?("0")
          word_decoder.decode(letter)
        end.join
      end
      something(variable)
    end

    def something(variable)
      if variable.count > 1
        variable.join(" ")
      elsif variable.count <= 1
        variable.join
      end
    end


  end
end
