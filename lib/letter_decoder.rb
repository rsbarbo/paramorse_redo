require_relative 'encodable'

class LetterDecoder
  include Encodable

  def decode(code)
    dictionary.key(code)
  end

  def dictionary_length
    dictionary
  end

end
