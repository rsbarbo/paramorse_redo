require './lib/encodable'

module ParaMorse
  class LetterEncoder
    include Encodable

    def encode(letter)
      dictionary[letter.upcase]
    end

    def dictionary_length
      dictionary
    end

  end
end
