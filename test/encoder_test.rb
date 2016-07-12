require_relative 'helper_test'
require_relative '../lib/encoder'

class EncoderTest < Minitest::Test
  def test_it_can_encode_a_word
    encoder = ParaMorse::Encoder.new
    expected = "1011101110001110111011100010111010001110101"
    assert_equal expected, encoder.encode("Word")
  end
end
