require_relative 'letter_encoder'

module ParaMorse

  class Encoder

    def encode(word)
      letter_encoder = LetterEncoder.new
      encoded_word = word.each_char.map.with_index do |letter, index|
        encoded_letter = letter_encoder.encode(letter)
      end
      encoded_word.join("000")
    end
  end

end
