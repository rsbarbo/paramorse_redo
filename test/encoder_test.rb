require_relative 'helper_test'
require_relative '../lib/encoder'

class EncoderTest < Minitest::Test
  def test_it_can_encode_a_word
    encoder = Encoder.new

    expected = "1011101110001110111011100010111010001110101"
    actual = encoder.encode("Word")

    assert_equal expected, actual
  end
end
