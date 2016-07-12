require_relative 'helper_test'
require_relative '../lib/letter_decoder'

class LetterDecoderTest < Minitest::Test

  def test_it_loads_encodable_module
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal 37,letter_decoder.dictionary_length.keys.length
  end

  def test_it_can_decode_the_letters_a_and_q
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal = "A", letter_decoder.decode("10111")
    assert_equal "Q", letter_decoder.decode("1110111010111")
  end

  def test_it_does_not_encode_letters_not_in_the_dictionary
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal nil, letter_decoder.decode("1011100000")
    assert_equal nil, letter_decoder.decode("10")
  end

end
