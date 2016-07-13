require "pry"
require "./lib/queue"
require "./lib/decoder"
require "./lib/encoder"

module ParaMorse
  class Streamer
    attr_accessor :queue, :word_decoder, :word_encoder

    def initialize
      @queue = ParaMorse::Queue.new.queue
      @word_decoder = ParaMorse::Decoder.new
      @word_encoder = ParaMorse::Encoder.new
    end

    def receive(input)
      @queue.push(input)
    end

    def decode
      if !@queue.include?("0" || "1")
        "Please make sure your input is binary numbers"
      else
        prepared = @queue.join
        pre_join_outcome(prepared)
      end
    end

    def pre_join_outcome(prepared)
        outcome = prepared.split("0000000").map do |word|
          word.split("000").map do |letter|
            letter.slice!(0) if letter.start_with?("0")
            letter.chop! if  letter.end_with?("0")
            word_decoder.decode(letter)
          end.join
        end
        joiner(outcome)
      end

    def joiner(outcome)
      if outcome.count > 1
        outcome.join(" ")
      elsif outcome.count <= 1
        outcome.join
      end
    end

    def encode
      if @queue.include?("0" || "1")
        "Please make sure your input is english like"
      else
        outcome = @queue.join
        word_encoder.encode(outcome)
      end
    end

  end
end
