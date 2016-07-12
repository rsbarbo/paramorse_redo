require_relative 'helper_test'
require_relative '../lib/decoder'

class DecoderTest < Minitest::Test

  def test_it_can_decode_morse_code
    decoder = ParaMorse::Decoder.new
    input = "1011101110001110111011100010111010001110101"
    expected = "WORD"
    assert_equal expected, decoder.decode(input)
  end

  def test_it_can_grab_last_letter
    decoder = ParaMorse::Decoder.new
    q = ParaMorse::Queue.new
    assert_equal "W" ,decoder.decode("101110111")
  end

  def test_it_can_grab_next_letter
    decoder = ParaMorse::Decoder.new
    q = ParaMorse::Queue.new
    assert_equal "W",decoder.decode("101110111000")
  end

  def test_it_knows_if_queue_ends_with_a_space
    decoder = ParaMorse::Decoder.new
    q = ParaMorse::Queue.new
    q2 = ParaMorse::Queue.new
    morse_code = "101110111000"
    morse_code2 = "101110111"
    morse_code.each_char do |digit|
      q.push(digit)
    end
    morse_code2.each_char do |digit|
      q2.push(digit)
    end
    expected1 = true
    actual1 = decoder.queue_ends_with_space?(q)
    expected2 = false
    actual2 = decoder.queue_ends_with_space?(q2)
    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_it_knows_if_queue_is_at_end_of_message
    decoder = ParaMorse::Decoder.new
    morse_code = "101"
    expected = [false, false, true]
    actual = morse_code.each_char.map.with_index do |digit, index|
      decoder.end_of_morse_code_message?(index, morse_code)
    end
    assert_equal expected, actual
  end

end
