require_relative 'encodable'

class LetterEncoder
  include Encodable

  def encode(letter)
    dictionary[letter.downcase]
  end

  def dictionary_length
    dictionary
  end

end
