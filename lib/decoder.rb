module ParaMorse

  class Decoder
    attr_reader :letter_decoder, :queue

    def initialize
      @letter_decoder = ParaMorse::LetterDecoder.new
      @queue = ParaMorse::Queue.new
    end

    def decode(morse_code)
      morse_code.split("0000000").map do |word|
        word.split("000").map do |letter|
          letter_decoder.decode(letter)
        end
      end.join
    end

      def queue_ends_with_space?(queue)
        queue.count >= 3 && queue.tail(3).join() === "000"
      end

      def end_of_morse_code_message?(index, morse_code)
        morse_code.length - 1 == index
      end
    end

  end
