module ParaMorse

  class StreamDecoder
    attr_reader :words

    def initialize
      @queue = ParaMorse::Queue.new
      @letter_decoder = ParaMorse::LetterDecoder.new
      @words = []
    end

    def receive(recieved_data)
      @queue.push(recieved_data)
      parse
    end

    def parse
      if @queue.tail(7) == ["0", "0", "0", "0", "0", "0", "0"]
        @words << @queue.pop(@queue.count - 7).join.split("000").reverse
        @queue.clear
      end
    end

    def access_final_word
      @words << @queue.pop(@queue.count).join.split("000").reverse
      @queue.clear
    end

    def decode
      access_final_word

      output = ""

      @words.each do |word|
        word.each do |letter|
          output << @letter_decoder.decode(letter)
        end
        output << " "
      end

      return output[0..-2]
    end

    def queue
      @queue.queue
    end

  end

end
