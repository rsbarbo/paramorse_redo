require_relative 'test_helper'
require_relative '../lib/letter_encoder'

class LetterEncoderTest < Minitest::Test
  def test_it_loads_encodable_module
    letter_encoder = LetterEncoder.new

    expected = 37
    actual = letter_encoder.dictionary_length.keys.length

    assert_equal expected, actual
  end

  def test_it_can_encode_the_letters_a_and_q
    letter_encoder = LetterEncoder.new

    expected1 = "10111"
    actual1 = letter_encoder.encode("a")
    expected2 = "1110111010111"
    actual2 = letter_encoder.encode("q")

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_does_not_encode_letters_not_in_the_dictionary
    letter_encoder = LetterEncoder.new

    expected = nil
    actual = letter_encoder.encode("!")
    actual2 = actual = letter_encoder.encode("abc")

    assert_equal expected, actual
    assert_equal expected, actual2
  end

end
