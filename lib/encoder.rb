require "./lib/letter_encoder"

module ParaMorse
  class Encoder

    def encode(word)
      letter_encoder = ParaMorse::LetterEncoder.new
      word.upcase.each_char.map do |letter|
        letter_encoder.encode(letter)
      end.join("000")
    end
  end

end
