module ParaMorse
  class Decoder
    attr_reader :letter_decoder, :queue

    def initialize
      @letter_decoder = ParaMorse::LetterDecoder.new
      @queue = ParaMorse::Queue.new
    end

    def decode(morse_code)
      outcome = morse_code.split("0000000").map do |word|
        word.split("000").map do |letter|
          letter_decoder.decode(letter)
        end
      end
      joiner(outcome)
    end

    def joiner(outcome)
      return sorter(outcome) if outcome.count > 1
      return outcome.join if outcome.count <= 1
    end

    def sorter(outcome)
      result = outcome.map do |word|
        word.join
      end.join(" ")
    end
  end

end
