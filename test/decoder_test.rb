require './test/helper_test'
require './lib/decoder'
require './lib/letter_decoder'
require './lib/queue'


class DecoderTest < Minitest::Test

  def test_it_can_decode_morse_code
    decoder = ParaMorse::Decoder.new
    input = "1011101110001110111011100010111010001110101"
    expected = "WORD"
    assert_equal expected, decoder.decode(input)
  end

  def test_it_can_grab_last_letter
    decoder = ParaMorse::Decoder.new
    assert_equal "W" ,decoder.decode("101110111")
  end

  def test_it_can_grab_next_letter
    decoder = ParaMorse::Decoder.new
    assert_equal "W",decoder.decode("101110111000")
  end

  def test_it_can_grab_next_letter
    decoder = ParaMorse::Decoder.new
    assert_equal "SS",decoder.decode("10101 10101")
  end

end
