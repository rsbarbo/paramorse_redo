require_relative 'helper_test'
require_relative '../lib/letter_decoder'

class LetterDecoderTest < Minitest::Test
  def test_it_loads_encodable_module
    letter_decoder = LetterDecoder.new

    expected = 37
    actual = letter_decoder.dictionary_length.keys.length

    assert_equal expected, actual
  end

  def test_it_can_decode_the_letters_a_and_q
    letter_decoder = LetterDecoder.new

    expected1 = "a"
    actual1 = letter_decoder.decode("10111")
    expected2 = "q"
    actual2 = letter_decoder.decode("1110111010111")

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_does_not_encode_letters_not_in_the_dictionary
    letter_decoder = LetterDecoder.new

    expected = nil
    actual = letter_decoder.decode("1011100000")
    actual2 = actual = letter_decoder.decode("10")

    assert_equal expected, actual
    assert_equal expected, actual2
  end

end
