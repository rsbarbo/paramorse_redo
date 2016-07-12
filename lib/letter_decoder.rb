require_relative 'encodable'

module ParaMorse

class LetterDecoder
  include Encodable

  def decode(code)
    dictionary.key(code)
  end

  def dictionary_length
    dictionary
  end

end
