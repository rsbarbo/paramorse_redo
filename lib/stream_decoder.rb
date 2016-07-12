require "pry"

module ParaMorse

  class StreamDecoder
    attr_reader :words
    attr_accessor :queue, :letter_decoder

    def initialize
      @queue = ParaMorse::Queue.new.queue
      @word_decoder = ParaMorse::Decoder.new
      @words = []
    end

    def receive(input)
      @queue.push(input)

    end

    def decode
       @queue

      word_decoder
    end

  end
end
