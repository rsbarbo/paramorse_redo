require './test/helper_test'
require './lib/letter_encoder'

class LetterEncoderTest < Minitest::Test
  def test_it_loads_encodable_module
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal 37, letter_encoder.dictionary_length.keys.length
  end

  def test_it_can_encode_the_letters_a_and_q
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal "10111", letter_encoder.encode("A")
    assert_equal "1110111010111", letter_encoder.encode("Q")
  end

  def test_it_does_not_encode_letters_not_in_the_dictionary
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal nil, letter_encoder.encode("!")
    assert_equal nil, letter_encoder.encode("abc")
  end


end
