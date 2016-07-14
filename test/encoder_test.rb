require './test/helper_test'
require './lib/encoder'

class EncoderTest < Minitest::Test
  def test_it_can_encode_a_word
    encoder = ParaMorse::Encoder.new
    expected = "1011101110001110111011100010111010001110101"
    assert_equal expected, encoder.encode("Word")
  end

  def test_it_can_encode_multiple_words
    encoder = ParaMorse::Encoder.new
    expected = "101010100010001011101010001011101010001110111011100000001011101110001110111011100010111010001011101010001110101"
    assert_equal expected, encoder.encode("Hello World")
  end
  

end
